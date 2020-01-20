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


['移动速度'] = 400,
['攻击距离'] = 2000,
['多重射'] = 10,
['技能冷却'] = 200,
['触发概率'] = 200,

['杀怪加全属性'] = 200000,
['全伤加深'] = 22000,
['暴击几率'] = 200,
['暴击加深'] = 3000,
['技暴几率'] = 200,
['技暴加深'] = 3000,

}

ac.game:event '玩家-注册英雄后'(function(_, _, hero)
    local p = hero:get_owner()
	if p.mall and (p.mall['资源大礼包'] or 0)>0 then 
        hero:add_skill('资源大礼包','隐藏')
	end   
end)


