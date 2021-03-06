local mall = {
    -- {'JBLB','金币礼包'},
    -- {'MCLB','木材礼包'},
    {'20000939','永久赞助'},
    {'20000936','永久超级赞助'},
    {'20000945','皇帝剑'},
    {'20000944','皇帝刀'},
    {'20000942','绝世阳炎翼'},
    {'20000947','轮迴幻魔翼'},

    {'20000943','骨龙'},
    {'20000941','小悟空'},

    {'20000932','至尊宝'},
    {'20000934','鬼厉'},
    {'20000933','剑仙'},
    -- {'YXZSB','剑仙直升包'},

    {'20000940','神仙水'},
    {'20000946','神装大礼包'},
    {'20000948','神技大礼包'},
    {'20000938','寻宝小飞侠'},
    
    {'20000949','孤风青龙领域'},
    {'20000950','远影苍龙领域'},

    {'20001055','真龙天子'},
    {'20000935','百变英雄礼包'},
}


local mt = ac.skill['满赞']
mt{
--等久
level = 0,
--图标
art = [[quanzz.blp]],
is_order = 1,
--说明
tip = [[

|cffFFE799【领取条件】|r|cffff0000购买全部商城道具|r后自动激活

|cffFFE799【满赞奖励】|r
|cff00ff00杀怪加全属性+888 攻击加全属性+888 每秒加全属性+888
|cff00ffff攻击减甲+888 减少周围护甲+1888
|cffffff00暴击加深+488% 技暴加深+488% 会心伤害+488%
|cffff0000物理伤害加深+488% 技能伤害加深+488% 全伤加深+488%

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 888,
['攻击加全属性'] = 888,
['每秒加全属性'] = 888,
['攻击减甲'] = 888,
['减少周围护甲'] = 1888,
['暴击加深'] = 488,
['技暴加深'] = 488,
['会心伤害'] = 488,
['物理伤害加深'] = 488,
['技能伤害加深'] = 488,
['全伤加深'] = 488,


}

ac.game:event '玩家-注册英雄' (function(_,p,hero)
    if not p.mall then 
        return 
    end
    local flag = true
    for i,data in ipairs(mall) do 
        local mall_name = data[2]
        if not p.mall[mall_name] or p.mall[mall_name] < 1  then 
            flag = false
            break
        end
    end        

    if flag then 
        local skl = hero:find_skill('满赞',nil,true)
        skl:set_level(1)
    end    

end)
