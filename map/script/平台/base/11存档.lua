local player = require 'ac.player'
local japi = require 'jass.japi'
local jass = require 'jass.common'
local dzapi = require 'jass.dzapi'
record_11 = true
register_japi([[
native  InitGameCache    takes string campaignFile returns gamecache
native  SaveGameCache    takes gamecache whichCache returns boolean

native EXNetUseItem  takes player player_id,string itemid,integer amount returns boolean

native  StoreInteger					takes gamecache cache, string missionKey, string key, integer value returns nothing
native  StoreReal						takes gamecache cache, string missionKey, string key, real value returns nothing
native  StoreBoolean					takes gamecache cache, string missionKey, string key, boolean value returns nothing
native  StoreUnit						takes gamecache cache, string missionKey, string key, unit whichUnit returns boolean
native  StoreString						takes gamecache cache, string missionKey, string key, string value returns boolean

native SyncStoredInteger        takes gamecache cache, string missionKey, string key returns nothing
native SyncStoredReal           takes gamecache cache, string missionKey, string key returns nothing
native SyncStoredBoolean        takes gamecache cache, string missionKey, string key returns nothing
native SyncStoredUnit           takes gamecache cache, string missionKey, string key returns nothing
native SyncStoredString         takes gamecache cache, string missionKey, string key returns nothing

native  HaveStoredInteger					takes gamecache cache, string missionKey, string key returns boolean
native  HaveStoredReal						takes gamecache cache, string missionKey, string key returns boolean
native  HaveStoredBoolean					takes gamecache cache, string missionKey, string key returns boolean
native  HaveStoredUnit						takes gamecache cache, string missionKey, string key returns boolean
native  HaveStoredString					takes gamecache cache, string missionKey, string key returns boolean

native  FlushGameCache						takes gamecache cache returns nothing
native  FlushStoredMission					takes gamecache cache, string missionKey returns nothing
native  FlushStoredInteger					takes gamecache cache, string missionKey, string key returns nothing
native  FlushStoredReal						takes gamecache cache, string missionKey, string key returns nothing
native  FlushStoredBoolean					takes gamecache cache, string missionKey, string key returns nothing
native  FlushStoredUnit						takes gamecache cache, string missionKey, string key returns nothing
native  FlushStoredString					takes gamecache cache, string missionKey, string key returns nothing

native  GetStoredInteger				takes gamecache cache, string missionKey, string key returns integer
native  GetStoredReal					takes gamecache cache, string missionKey, string key returns real
native  GetStoredBoolean				takes gamecache cache, string missionKey, string key returns boolean
native  GetStoredString					takes gamecache cache, string missionKey, string key returns string
native  RestoreUnit						takes gamecache cache, string missionKey, string key, player forWhichPlayer, real x, real y, real facing returns unit
native EXNetSaveRemoteData  takes integer player_id, string Key ,string value returns boolean
native EXNetLoadRemoteData  takes integer player_id, string Key returns string
]])
ac.flag_use_mall = true --默认使用商城数据
local has_record = not not japi.InitGameCache
log.debug('积分环境', has_record)
-- japi.EXNetSaveRemoteData = japi.EXNetSaveRemoteData or function() print('没有japi.EXNetSaveRemoteData') end
-- japi.EXNetLoadRemoteData = japi.EXNetLoadRemoteData or function() print('没有japi.EXNetLoadRemoteData') end
-- GetStoredString( ctable,EXGetPlayerRealName(p), rKey )
print('检测函数环境：',japi.EXNetLoadRemoteData)

local names = {
	'FlushGameCache',
	'InitGameCache',
	'StoreInteger',
	'GetStoredInteger',
	'StoreString',
	'GetStoredString',
	'SaveGameCache',
    'SyncStoredInteger',
    'HaveStoredInteger',
}
for _, name in ipairs(names) do
	if not japi[name] then
		rawset(japi, name, jass[name])
	end
end

local function get_key(player)
	return ("ABCDEFGHIJKLMNOPQRSTUVWXYZ"):sub(player:get(),player:get())
end

--获取积分对象
function ac.player.__index:record()
	if not self.record_data then
		if self:is_player() then
			self.record_data = japi.InitGameCache('11billing@' .. get_key(self))
		else
			self.record_data = japi.InitGameCache('')
		end
	end
	return self.record_data
end

--判断玩家是否有商城道具(用来做判断皮肤，人物，地图内特权VIP)等等
function ac.player.__index:Map_HasMallItem(key)
    if has_record then
		-- return true --本地测试
		return japi.HaveStoredInteger(self:record(), "状态", key) 
	end
	print('warning: has_record为空')
    --测试时，默认都为空
	return false
end

--扣除玩家一个次数类道具（例如逃跑清除卡，使用后道具 - 1）扣除成功后返回true 失败返回false
function ac.player.__index:sub_item(key,i)
	return japi.EXNetUseItem(self.handle,key,i)
end



-- RPG积分相关
local score_gc
local function get_score()
	if not score_gc then
		japi.FlushGameCache(japi.InitGameCache("11.x"))
		score_gc = japi.InitGameCache("11.x")
	end
	return score_gc
end
local ctable
local function get_ctable()
	if not ctable then
		japi.FlushGameCache(japi.InitGameCache("11.s"))
		ctable = japi.InitGameCache("11.s")
	end
	return ctable
end

local current_player
local function get_player()
	if current_player and current_player:is_player() then
		return current_player
	end
	for i = 1, 12 do
		if ac.player[i]:is_player() then
			current_player = ac.player[i]
			return current_player
		end
	end
	return ac.player[1]
end

local function write_score(table, key, data)
	japi.StoreInteger(get_score(), table, key, data)
	if get_player():is_self() then
		japi.SyncStoredInteger(get_score(), table, key)
	end
end

local function read_score(table, key)
	return japi.GetStoredInteger(get_score(), table, key)
end
local function read_score_string(table, key)
	return japi.GetStoredString(get_ctable(), table, key)
end

local score = {}

function ac.player.__index:Map_GetServerValue(name)
	if not score[name] then
		score[name] = {}
	end
	if not score[name][self.id] then
		--先载入
		-- local str_score = japi.EXNetLoadRemoteData and japi.EXNetLoadRemoteData((self.id-1),name)
		-- if str_score then 
		-- 	print('sdfsdf:',name,str_score)
		-- end
		score[name][self.id] = read_score(get_key(self), name)  
		score[name][self.id] = (score[name][self.id] == '' or score[name][self.id] == 0) and read_score_string(self:get_name(), name) or score[name][self.id]
		-- score[name][self.id] = score[name][self.id] == 0 and 
	end
	-- print('测试读取数据：',tonumber(score[name][self.id]),score[name][self.id],read_score(get_key(self), name),read_score_string(self:get_name(), name) )
	local value = tonumber(score[name][self.id]) or 0
	log.debug(('获取RPG积分:[%s][%s] --> [%s][%s]'):format(self:get_name(), name, score[name][self.id],read_score_string(self:get_name(), name) ))
	return value
end

function ac.player.__index:Map_SaveServerValue(name, value)
    value = tonumber(value)
	if not score[name] then
		score[name] = {}
    end
	score[name][self.id] = value
	log.debug(('设置RPG积分:[%s][%s] = [%s]'):format(self:get_name(), name, value))
	if has_record then
		write_score(get_key(self) .. "=", name, value)
	else
		write_score(get_key(self), name, value)
	end
    local key_name,type = ac.server.key2name(name)
	--保存一份存档
	-- print('保存存档2',type,key_name,v)
	if japi.EXNetSaveRemoteData and type and type =='存档' then 
		japi.EXNetSaveRemoteData((self.id-1),name,tostring(value))
	end

    --保存本局数据
    if not self.cus_server then 
        self.cus_server ={}
    end    
	local key_name = ac.server.key2name(name)
    self.cus_server[key_name] = tonumber(value)
end

-- function player.__index:Map_AddServerValue(key,value)
--     if not self.cus_server then 
--         self.cus_server ={}
--     end    
--     --保存
--     local key_name = ac.server.key2name(key)
--     -- print(key_name,self.cus_server[key_name])
--     self.cus_server[key_name] = (self.cus_server[key_name] or 0 ) + tonumber(value)
--     self:Map_SaveServerValue(key,self.cus_server[key_name])
-- end
--防止回档
function ac.player.__index:Map_AddServerValue(name, value)
	value = tonumber(value)
	local r = self:Map_GetServerValue(name) + value
	score[name][self.id] = r

	if not self.cus_server then 
        self.cus_server ={}
    end    
    --保存
    local key_name,t_type = ac.server.key2name(name)
	self.cus_server[key_name] = (self.cus_server[key_name] or 0 ) + tonumber(value)
	
	local type = '增加'
	if value < 0 then
		type = '减少'
	end

	log.debug((type..'RPG积分:[%s][%s] + [%s]'):format(self:get_name(), name, value))
	if has_record then
		write_score(get_key(self) .. "+", name, value)
	else
		write_score(get_key(self), name, r)
	end
	--保存一份存档
	local v = math.max(self.cus_server[key_name],r) --避免造成回档
	-- print('保存存档1',t_type,key_name,v)
	if japi.EXNetSaveRemoteData and t_type and t_type =='存档' then 
		-- print('增加后的数值：',tostring(v),self.cus_server[key_name],r)
		japi.EXNetSaveRemoteData((self.id-1),name,tostring(v))
	end
end

--玩家 清空服务器数据 (自定义服务器)
function ac.player.__index:clear_server(...)
    local player = self
    --没有传参，默认全部清除
    if not ... then 
        for i,v in ipairs(ac.cus_server_key) do 
            local key = v[1]
            -- player:SetServerValue(key,0) 自定义服务器
            
            -- player:Map_SaveServerValue(key,0) --网易服务器
            player:Map_SaveServerValue(key,0) --网易服务器
        end    
    else
        for i,key in ipairs(...) do
            -- print(key,value)
            player:Map_SaveServerValue(key[1],0) --网易服务器
        end   
    end    
end    

--所有玩家 清空服务器档案
function ac.clear_all_server(...)
    for i = 1, 10 do
        local player = ac.player(i)
        if player:is_player() then 
            player:clear_server(...)
        end   
    end
end
--获取玩家地图等级
function ac.player.__index:Map_GetMapLevel()
	local handle = self.handle
	local level = self.cus_server and (self.cus_server['地图等级'] or 0) > 0 and self.cus_server['地图等级'] or 1 
	level = (level or 1) + (self['局内地图等级'] or 0)
	if not ac.flag_use_mall then 
		level = 1
	end       
	return level
end

function ac.game:score_game_end()
	write_score("$", "GameEnd", 0)
end

--自己模拟地图等级
local time =120
ac.loop(time * 1000,function()
    for i = 1,10 do
        local p = ac.player[i]
		if p:is_player() then
			p:AddServerValue('exp',time) --自定义服务器
			-- p:Map_AddServerValue('exp',60) 
			local exp = p.cus_server2 and p.cus_server2['地图经验']
			if exp then 
				local new_level = math.floor(math.sqrt(exp/3600)+1)
				local old_level = p.cus_server['地图等级'] or 1
				if new_level >= old_level then 
					p:Map_SaveServerValue('level',new_level) --当前地图等级=开方（经验值/3600）+1
					p:Map_SaveServerValue('exp',math.floor(exp/3600)) --当前地图等级=开方（经验值/3600）+1
				end
			end
        end
    end
end)
--开局就从服务器读取经验
ac.wait(900,function()
    for i = 1,10 do
        local p = ac.player[i]
		if p:is_player() then
			--读取自定义服务器
			p:GetServerValue('exp',function(flag)
				ac.wait(0,function()
					if not flag then 
						p:sendMsg('|cffff0000读取地图等级失败，请重启魔兽后再试或进群反馈（941405246）|r')
						p:sendMsg('|cffff0000读取地图等级失败，请重启魔兽后再试或进群反馈（941405246）|r')
						p:sendMsg('|cffff0000读取地图等级失败，请重启魔兽后再试或进群反馈（941405246）|r')
						print('|cffff0000读取地图等级失败，请重启魔兽后再试或进群反馈（941405246）|r',p)
					end	
				end)
				-- ac.wait(500,function()
				-- end)
			end) 
        end
    end
end)
