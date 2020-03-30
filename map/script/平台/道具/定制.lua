local mt = ac.skill['资源大礼包']
mt{
--等久
level = 1,
--图标
art = [[sxs2.blp]],
is_order = 1,
--说明
tip = [[

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['木头加成'] = 3000,
['杀敌数加成'] = 3000,
['物品获取率'] = 3000,
['火灵加成'] = 3000,


['移动速度'] = 800,
['攻击距离'] = 2000,
['多重射'] = 10,
['技能冷却'] = 200,
['触发概率'] = 200,

['杀怪加全属性'] = 200000,
['全伤加深'] = 52000,
['暴击几率'] = 200,
['暴击加深'] = 13000,
['技暴几率'] = 200,
['技暴加深'] = 13000,

['会心伤害'] = 10000,
['物理伤害加深'] = 10000,
['技能伤害加深'] = 10000,
}
local mt = ac.skill['资源大礼包2']
mt{
--等久
level = 1,
--图标
art = [[sxs2.blp]],
is_order = 1,
--说明
tip = [[

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['移动速度'] = 800,
['攻击距离'] = 2000,
}

local mt = ac.skill['资源大礼包3']
mt{
--等久
level = 1,
--图标
art = [[sxs2.blp]],
is_order = 1,
--说明
tip = [[

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['触发概率加成'] = 1000,
['技能冷却'] = 1000,
['免伤几率极限'] = 3,
['免伤几率'] = 93,
['闪避极限'] = 3,
['闪避'] = 93,
['免伤极限'] = 3,
['免伤'] = 93,
['会心几率极限'] = 3,
['会心几率'] = 93,
['木头加成'] = 4000,

}

ac.game:event '玩家-注册英雄后'(function(_, _, hero)
    local p = hero:get_owner()
    for i,name in ipairs({'资源大礼包','资源大礼包2','资源大礼包3'}) do 
        if p.mall and (p.mall[name] or 0)>0 then 
            hero:add_skill(name,'隐藏')
        end   
    end
end)


