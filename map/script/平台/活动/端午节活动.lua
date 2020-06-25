
local mt = ac.skill['粽香飘四海，共话端午情']
mt{
--等久
level = 1,
is_order = 1,
--图标
art = [[duanwu.blp]],
--说明
tip = [[ 
|cffffe799【活动时间】|r|cff00ff006月25日-7月1日
|cffffe799【活动说明】|r|cff00ff00仲夏端午，烹鹜角黍。|cff00ffff侠士们如果获得了包粽子的材料，记得来此处进行制作，获得|cffffff00 意外的奖励
]],
--物品类型
item_type = '神符',
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
--冷却
cool = 1,
--物品技能
is_skill = true,
store_affix = '',
store_name = '|cffdf19d0粽香飘四海，共话端午情|r',
--物品详细介绍的title
content_tip = ''
}

--自定义ui展示
local new_ui = class.panel:builder
{
    x = 10,--假的
    y = 465,--假的
    w = 300,
    h = 100,
    is_show = false,
    name = '端午节', 
    normal_image = '',
    data = {
        ['粽叶'] = 'zongye.blp',
        ['糯米'] = 'nuomi.blp',
        ['棕馅'] = 'zongxian.blp',
    },
    -- close_button = {
    --     type = 'button',
    --     x = 1068 -32-5,
    --     y = 5,
    --     w = 32,
    --     h = 32,
    --     normal_image = 'image\\抽奖\\close.tga',
    --     has_ani = true,
    --     on_button_clicked = function (self,button)
    --         local pannel = self.parent
    --         pannel:hide()
    --     end, 
    -- },
    create_bts = function(self)
        self.btns = {}
        print('创建 粽子材料按钮')
        for i=1,3 do 
            local gap = 10 
            local width = 64
            local h = 64
            local btn = class.panel:builder
            {
                y = (i-1)*gap + (i-1)*width,
                w = width,
                h = h,
                parent = self,
                is_show = false,
                name = '粽子材料按钮', 
                normal_image = 'zongye.blp',
                event_btn = {
                    type = 'button',
                    on_button_mouse_enter = function (self)
                        local title = self.parent.name
                        local tip = [[
|cff00ffff【粽叶】+【糯米】+【棕馅】=|cffdf19d0【美味的粽子】|cff00ff00（可在“活动使者”（基地右下角）处，进行兑换）

|cffcccccc端午节活动物品|r]]
                        self:tooltip('|cffffe799'..title..'|r',tip,0,300,94)
                    end,
                },
                shadow = {
                    x = width*0.54,
                    y = h*0.64,
                    w = width*0.4,
                    h = h*0.3,
                    name = '材料数量',
                    type = 'texture',
                    normal_image = [[image\12.blp]],
                    
                    cnt = {
                        y = 1,
                        name = '材料数量',
                        type = 'text',
                        text = 33,
                        color = 0xffffffff,
                        font_size = 8,
                        align = 'center'
                    },
                },

            }
            table.insert(self.btns,btn)
        end
    end,
    --全部刷新
    fresh = function(self)
        local p = ac.player.self
        p.cnt = p.cnt or {}
        local i = 0
        for name,v in sortpairs(p.cnt) do 
            i = i + 1
            local img = self.data[name]
            self.btns[i]:set_normal_image(img)
            self.btns[i].name = name
            self.btns[i].shadow.cnt:set_text(v)
            self.btns[i]:show()
        end
        -- p.cnt[]
        -- for i,btn in ipairs(self.btns) do 
    end,


}
new_ui:create_bts()
print('加载了端午节活动')



--奖品
local award_list = { 
    ['赤灵精品粽'] =  {
        { rand = 5, name = '金'},
        { rand = 5, name = '红'},
        { rand = 35, name = '随机技能书'},
        { rand = 5, name = '点金石*1'},
        { rand = 5, name = '点金石*5'},
        { rand = 5, name = '点金石*10'},
        { rand = 5, name = '恶魔果实*1'},
        { rand = 5, name = '吞噬丹*1'},
        { rand = 5, name = '格里芬*1'},
        { rand = 5, name = '黑暗项链*1'},
        { rand = 5, name = '最强生物心脏*1'},
        { rand = 5, name = '白胡子的大刀*1'},
        { rand = 5, name = '赤灵精品粽'},
        { rand = 5, name = '无'},


    },
}


local function give_award(hero) 
    local p = hero:get_owner()
    local player = hero:get_owner()
    local peon = p.peon
    local rand_list = award_list['赤灵精品粽']
    local rand_name,rand_rate = ac.get_reward_name(rand_list)
    -- print(rand_list,rand_name)  
    if not rand_name then 
        return true
    end
    if rand_name == '无' then
        p:sendMsg('|cffffe799【系统消息】|r |cff00ffff美味的粽子|cff00ff00果真名不虚传阿',3) 
    elseif  finds(rand_name,'点金石','恶魔果实','格里芬','黑暗项链','吞噬丹','最强生物心脏','白胡子的大刀') then
        local it
        --处理掉落物品相关
        for k,v in rand_name:gmatch '(%S+)%*(%d+%s-)' do
            for i=1,tonumber(v) do 
                it = hero:add_item(k,true)
            end 
        end
        p:sendMsg('|cffffe799【系统消息】|r|cff00ff00这个粽子里面怎么有东西硬硬的，获得|cffff0000'..(rand_name)..'|r',4) 
    elseif  finds('红 金',rand_name) then   
        local list = ac.quality_item[rand_name]
        local name = list[math.random(#list)]
        --满时，掉在地上
        local it = hero:add_item(name)
        p:sendMsg('|cffffe799【系统消息】|r|cff00ff00这个粽子里面怎么有东西硬硬的，获得|cffff0000'..(it.color_name or rand_name)..'|r',4)

    elseif finds(rand_name,'随机技能书')  then    
        local rand_list = ac.unit_reward['商店随机技能']
        local rand_name = ac.get_reward_name(rand_list)
        if not rand_name then 
            return
        end    
        local list = ac.skill_list2
        --添加给购买者
        local name = list[math.random(#list)]
        ac.item.create_skill_item(name,unit:get_point())
        p:sendMsg('|cffffe799【系统消息】|r |cff00ff00这个粽子里面怎么有东西硬硬的，获得|cffff0000'..name..'|r',4)
        
    elseif  finds('地阶 天阶',rand_name) then   
        local list = ac.quality_skill[rand_name]
        local name = list[math.random(#list)]
        --满时，掉在地上
        local it = ac.item.add_skill_item(name,hero)
        local color = it and it.color 
        p:sendMsg('|cffffe799【系统消息】|r|cff00ff00这个粽子里面怎么有东西硬硬的，获得|cff'..ac.color_code[color or '白']..'【技能书】'..name..'|r',4)
    elseif finds(rand_name,'随机卡片')  then    
        local list = {
            '杀敌数保本卡','木头保本卡','魔丸保本卡','全属性保本卡',
            '杀敌数翻倍卡','木头翻倍卡','魔丸翻倍卡','全属性翻倍卡',
            '炸弹卡','大炸弹卡','猜拳卡','gg卡'
        }
        local name = list[math.random(#list)]
        local it = hero:add_item(name)
        p:sendMsg('|cffffe799【系统消息】|r|cff00ff00这个粽子里面怎么有东西硬硬的，获得|cffff0000'..name..'|r',4)
    elseif  rand_name == '赤灵精品粽' then 
        local key = ac.server.name2key(rand_name)
        if p:Map_GetServerValue(key) < ac.skill[rand_name].max_level  then 
            --激活成就（存档） 
            p:AddServerValue(key,1) --自定义服务器
            --动态插入魔法书
            local skl = hero:find_skill(rand_name,nil,true) 
            if not skl  then 
                ac.game:event_notify('技能-插入魔法书',hero,'精彩活动',rand_name)
                ac.player.self:sendMsg('|cffffe799【系统消息】|r |cff00ffff'..player:get_name()..'|r 不断食用美味的粽子，惊喜获得|cffff0000【可存档成就】'..rand_name..'|r，成就属性可在“最强魔灵-活动成就”中查看',6) 
            else
                skl:upgrade(1)
                ac.player.self:sendMsg('|cffffe799【系统消息】|r |cff00ffff'..player:get_name()..'|r 不断食用美味的粽子，使|cffff0000【可存档成就】'..rand_name..'|r得到了升级，升级后的属性可在“最强魔灵-活动成就”中查看',6) 
            end   
        else   
            --重新来一次
            give_award(hero)
        end    
    end    


end

local mt = ac.skill['制作 美味的粽子']
mt{
--等久
level = 1,
--图标
art = [[mljpz.blp]],
is_order = 1,
--说明
tip = [[ 
|cffffe799【制作说明】|r

|cff00ff00消耗 |cffff0000【粽叶】+【糯米】+【棕馅】 |cff00ff00制作 |cffffff00【美味的粽子】
]],
--物品类型
item_type = '神符',
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
--冷却
cool = 1,
--物品技能
is_skill = true,
store_affix = '',
store_name = '|cffdf19d0制作 美味的粽子|r',
--物品详细介绍的title
content_tip = ''
}
function mt:on_cast_start()
    local hero = self.owner
    local p = hero.owner
    p.cnt = p.cnt or {}
    if p.cnt['粽叶'] and p.cnt['粽叶'] >= 1 and p.cnt['糯米'] and p.cnt['糯米']>=1 and p.cnt['棕馅'] and  p.cnt['棕馅']>=1 then 
        --扣材料
        p.cnt['粽叶'] = p.cnt['粽叶'] - 1
        p.cnt['糯米'] = p.cnt['糯米'] - 1
        p.cnt['棕馅'] = p.cnt['棕馅'] - 1
        --刷新ui
        if p:is_self() then 
            new_ui:fresh()
            new_ui:show()
        end
        --给奖励
        give_award(hero)
    else
        p:sendMsg('|cffffe799【系统消息】|cffff0000制作条件不足',5)
    end    

end

--获得事件
local unit_reward = { 
    ['端午怪'] =  {
        { rand = 30.04,     name = '粽叶'},
        { rand = 30.04,     name = '糯米'},
        { rand = 30.04,     name = '棕馅'},
    },
}
ac.game:event '单位-死亡' (function (_,unit,killer)
    if not finds(unit:get_name(),'经验怪','金币','木头','火灵','强盗','藏经阁','剑冢小弟','剑魔','百花宫宫女','苏若颜','龙宫守卫','哪吒','城堡守卫','牛头马面') then 
        return
    end    
    local p = killer:get_owner()
    local rand_name = ac.get_reward_name(unit_reward['端午怪'])  
    if not rand_name then 
        return 
    end   

    if not p.cnt then 
        p.cnt = {}
    end
    if not p.max_fall_cnt then 
        p.max_fall_cnt = {}
    end
    p.max_fall_cnt[rand_name] = (p.max_fall_cnt[rand_name] or 0) +1
    --获得最多次数
    local max_fall_cnt = 10   
    if p.max_fall_cnt[rand_name] <= max_fall_cnt then 
        --当前个数+1
        p.cnt[rand_name] = (p.cnt[rand_name] or 0) +1
        --刷新ui
        if p:is_self() then 
            new_ui:show()
            new_ui:fresh()
        end
    end    
end)
