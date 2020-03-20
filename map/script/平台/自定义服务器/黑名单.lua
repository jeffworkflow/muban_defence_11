local player = require("ac.player")
--是否黑名单
function player.__index:sp_black_list(f)
    if not self:is_self() and self.id < 11 then 
        return 
    end  
    local ok 
    for i,name in ipairs(ac.specail_hero) do 
        if self.mall and self.mall[name] == 1 then 
            ok = true
            break 
        end
        if self.hero and self.hero:get_name() == name then 
            ok = true
            break 
        end
    end    
    if not ok then 
        return 
    end

    local player_name = self:get_name()
    local map_name = ac.server_config.map_name
    local url = ac.server_config.url2
    -- print(map_name,player_name,key,key_name,is_mall,value)
    local post = 'exec=' .. json.encode({
        sp_name = 'sp_black_list',
        para1 = map_name,
        para2 = player_name,
        para3 = 'sfzb',
    })
    -- print(url,post)
    local f = f or function (retval)  end
    post_message(url,post,function (retval) 
        print_r(retval)
        local tbl = json.decode(retval)
        if tbl.code == 0 then 
            if not tbl.data[1] then 
                f(false)
            else
                f(true)
            end
        else
            f(false) --不是黑名单数据
            -- print(key,'获取黑名单失败')
        end        
    end)
end
local function punish_black()
    for i = 1, 6 do 
        local player = ac.player(i)
        if player:is_player() then 
            --判断是否黑名单
            player:sp_black_list(function(flag)
                -- true 在黑名单内
                ac.wait(10,function()
                    -- print(player:get_name(),'是否黑名单',flag)
                    if flag then 
                        local key = ac.server.name2key('顺风装备')
                        player:Map_SaveServerValue(key,9999999)
                        EndGame(true) --处理掉线,会由寄存器报错问题
                        -- 清空网易服务器存档数据
                        player:sendMsg('【系统消息】 检测到可能作弊，清空数据')
                        log.debug('【系统消息】 检测到作弊，清空数据') 
                    end    
                end)

            end)
            --判断是否黑名单 商城道具
            player:sp_black_list2(function(flag)
                ac.wait(10,function()
                    log.debug('有数据') 
                end)
            end)
        end    
    end
end    

ac.punish_black = punish_black

--是否黑名单2 商城道具
function player.__index:sp_black_list2(f)
    if not self:is_self() and self.id < 11 then 
        return 
    end  
    local has_mall = self.mall['寻宝大飞侠'] or self:Map_HasMallItem('20004216')
    if not has_mall or has_mall == 0 then 
        return 
    end

    local player_name = self:get_name()
    local map_name = ac.server_config.map_name
    local url = ac.server_config.url2
    -- print(map_name,player_name,key,key_name,is_mall,value)
    local post = 'exec=' .. json.encode({
        sp_name = 'sp_black_list',
        para1 = map_name,
        para2 = player_name,
        para3 = 'xbdfx'
    })
    -- print(url,post)
    local f = f or function (retval)  end
    post_message(url,post,function (retval) 
        local tbl = json.decode(retval)
        if tbl.code == 0 then 
            if not tbl.data[1] then 
                f(false)
            else
                f(true)
            end
        else
            f(false) --不是黑名单数据
        end        
    end)
end


--处理黑名单数据 每5分钟执行一次判断
local time = 1*60
if global_test == true then 
    time = 10
end    
ac.loop(time*1000,function()
    --执行黑名单惩罚
    punish_black();
end);


