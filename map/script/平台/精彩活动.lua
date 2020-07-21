local mt = ac.skill['缘定三生']
mt{
--等级
level = 1, --要动态插入
--图标
art = [[ydss.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【获得方式】：|r
|cff00ffff消耗 |cffff0000三十根喜鹊翎毛|r |cff00ffff兑换获得

|cffFFE799【成就属性】：|r
|cff00ff00+13.8   杀怪加全属性|r
|cff00ff00+13.8   攻击减甲|r
|cff00ff00+13.8%  木头加成|r
|cff00ff00+13.8%  会心伤害|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 13.8,
['木头加成'] = 13.8,
['攻击减甲'] = 13.8,
['会心伤害'] = 13.8,
need_map_level = 5,
}

local mt = ac.skill['井底之蛙']
mt{
--等级
level = 1, 
max_level = 3, 
--图标
art = [[jdzw.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【获得方式】：|r
|cff00ffff抓青蛙活动获得 |cffff0000重复完成可升级成就|r |cff00ffff最大等级=3

|cffFFE799【成就属性】：|r
|cff00ff00+%杀怪加全属性%   |cff00ff00杀怪加全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%杀敌数加成% |cff00ff00%  杀敌数加成|r
|cff00ff00+%物理伤害加深% |cff00ff00%  物理伤害加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = {16.8,33.6,46.6},
['杀敌数加成'] = {16.8,33.6,46.6},
['攻击减甲'] = {16.8,33.6,46.6},
['物理伤害加深'] = {16.8,33.6,46.6},
need_map_level = 5,
}


local mt = ac.skill['食物链顶端的人']
mt{
--等级
level = 1, 
max_level = 3, 
--图标
art = [[swldd.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【获得方式】：|r
|cff00ffff抓青蛙活动获得 |cffff0000重复完成可升级成就|r |cff00ffff最大等级=3

|cffFFE799【成就属性】：|r
|cff00ff00+%杀怪加全属性%   杀怪加全属性|r
|cff00ff00+%攻击减甲%   攻击减甲|r
|cff00ff00+%物品获取率% %  物品获取率|r
|cff00ff00+%暴击加深% %  暴击加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = {18.8,37.6,46.6},
['物品获取率'] = {18.8,37.6,46.6},
['攻击减甲'] = {18.8,37.6,46.6},
['暴击加深'] = {18.8,37.6,46.6},
need_map_level = 5,
}


local mt = ac.skill['有趣的灵魂']
mt{
--等级
level = 1, --要动态插入
max_level = 15,
--图标
art = [[zyj.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff通过 有趣的灵魂 活动获得 |cffff0000重复超度灵魂可升级成就|r |cff00ffff最大等级=15

|cffFFE799【成就属性】：|r
|cff00ff00+%暴击加深% |cff00ff00% |cff00ff00暴击加深
+%技暴加深% |cff00ff00% |cff00ff00技暴加深
+%会心伤害% |cff00ff00% |cff00ff00会心伤害
+%物理伤害加深% |cff00ff00% |cff00ff00物理伤害加深
+%技能伤害加深% |cff00ff00% |cff00ff00技能伤害加深
+%全伤加深% |cff00ff00% |cff00ff00全伤加深
+%对BOSS额外伤害% |cff00ff00% |cff00ff00对BOSS额外伤害|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['暴击加深'] = {1,15},
['技暴加深'] = {1,15},
['会心伤害'] = {1,15},
['物理伤害加深'] = {1,15},
['技能伤害加深'] = {1,15},
['全伤加深'] = {1,15},
['对BOSS额外伤害'] = {1,15},
need_map_level = 5,
}

local mt = ac.skill['蒙娜丽莎的微笑']
mt{
--等级
level = 1, --要动态插入
max_level = 2,
--图标
art = [[sldzx.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff通过 活动-失落的真相 获得，|cff00ffff最大等级=2

|cffFFE799【成就属性】：|r
|cff00ff00+%杀怪加全属性%   杀怪加全属性|r
|cff00ff00+%攻击减甲%   攻击减甲|r
|cff00ff00+%火灵加成% %  火灵加成|r
|cff00ff00+%全伤加深% %  全伤加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = {23.8,38.8},
['火灵加成'] = {23.8,38.8},
['攻击减甲'] = {23.8,38.8},
['全伤加深'] = {23.8,38.8},

need_map_level = 5,
}

local mt = ac.skill['四海共团圆']
mt{
--等级
level = 1, --要动态插入
max_level = 2,
--图标
art = [[shgty.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff通过 中秋活动 获得，|cffff0000重复获得可升级成就|r |cff00ffff最大等级=2

|cffFFE799【成就属性】：|r
|cff00ff00+%杀怪加全属性% |cff00ff00杀怪加全属性
|cff00ff00+%攻击减甲% |cff00ff00攻击减甲
|cff00ff00+%杀敌数加成% |cff00ff00% |cff00ff00杀敌数加成
|cff00ff00+%全伤加深% |cff00ff00% |cff00ff00全伤加深

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = {26.8,36.8},
['杀敌数加成'] = {26.8,36.8},
['攻击减甲'] = {26.8,36.8},
['全伤加深'] = {26.8,36.8},

need_map_level = 5,
}

local mt = ac.skill['第一个吃螃蟹的人']
mt{
--等级
level = 1, 
max_level = 20,
--图标
art = [[dygcpxdr.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff中秋活动期间，每局第一个食用“肥美的螃蟹”的玩家可获得 |cffff0000重复获得成就可升级成就|r |cff00ffff最大等级=20

|cffFFE799【成就属性】：|r
|cff00ff00+%杀怪加全属性%   |cff00ff00杀怪加全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%物品获取率% |cff00ff00% |cff00ff00物品获取率|r
|cff00ff00+%全伤加深% |cff00ff00% |cff00ff00全伤加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = {2,40},
['攻击减甲'] = {2,40},
['物品获取率'] = {2,40},
['全伤加深'] = {2,40},

need_map_level = 5,
}
--=======================中秋活动=====================
local mt = ac.skill['秀才']
mt{
--等级
level = 1, 
--图标
art = [[xiucai.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff通过 中秋活动 获得

|cffFFE799【成就属性】：|r
|cff00ff00+18.8   杀怪加全属性|r
|cff00ff00+18.8   攻击减甲|r
|cff00ff00+18.8%  木头加成|r
|cff00ff00+18.8%  全伤加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 18.8,
['攻击减甲'] = 18.8,
['木头加成'] = 18.8,
['全伤加深'] = 18.8,

need_map_level = 5,
}
local mt = ac.skill['举人']
mt{
--等级
level = 1, 
--图标
art = [[juren.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff通过 中秋活动 获得

|cffFFE799【成就属性】：|r
|cff00ff00+28.8   杀怪加全属性|r
|cff00ff00+28.8   攻击减甲|r
|cff00ff00+28.8%  木头加成|r
|cff00ff00+28.8%  全伤加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 28.8,
['攻击减甲'] = 28.8,
['木头加成'] = 28.8,
['全伤加深'] = 28.8,

need_map_level = 5,
}
local mt = ac.skill['进士']
mt{
--等级
level = 1, 
--图标
art = [[jinshi.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff通过 中秋活动 获得

|cffFFE799【成就属性】：|r
|cff00ff00+38.8   杀怪加全属性|r
|cff00ff00+38.8   攻击减甲|r
|cff00ff00+38.8%  木头加成|r
|cff00ff00+38.8%  全伤加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 38.8,
['攻击减甲'] = 38.8,
['木头加成'] = 38.8,
['全伤加深'] = 38.8,

need_map_level = 5,
}

local mt = ac.skill['探花']
mt{
--等级
level = 1, 
--图标
art = [[tanhua.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff通过 中秋活动 获得

|cffFFE799【成就属性】：|r
|cff00ff00+48.8   杀怪加全属性|r
|cff00ff00+48.8   攻击减甲|r
|cff00ff00+48.8%  木头加成|r
|cff00ff00+48.8%  全伤加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 48.8,
['攻击减甲'] = 48.8,
['木头加成'] = 48.8,
['全伤加深'] = 48.8,

need_map_level = 5,
}
local mt = ac.skill['榜眼']
mt{
--等级
level = 1, 
--图标
art = [[bangyan.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff通过 中秋活动 获得

|cffFFE799【成就属性】：|r
|cff00ff00+68.8   杀怪加全属性|r
|cff00ff00+68.8   攻击减甲|r
|cff00ff00+68.8%  木头加成|r
|cff00ff00+68.8%  全伤加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 68.8,
['攻击减甲'] = 68.8,
['木头加成'] = 68.8,
['全伤加深'] = 68.8,

need_map_level = 5,
}


local mt = ac.skill['状元']
mt{
--等级
level = 1, 
--图标
art = [[zhuangyuan.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff通过 中秋活动 获得

|cffFFE799【成就属性】：|r
|cff00ff00+88.8   杀怪加全属性|r
|cff00ff00+88.8   攻击减甲|r
|cff00ff00+88.8%  木头加成|r
|cff00ff00+88.8%  全伤加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 88.8,
['攻击减甲'] = 88.8,
['木头加成'] = 88.8,
['全伤加深'] = 88.8,

need_map_level = 5,
}
local bobing_str = {
    '秀才','举人','进士','探花','榜眼','状元'
}


local mt = ac.skill['细嚼慢咽']
mt{
--等级
level = 1, 
--图标
art = [[yuanxiao1.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff通过 元宵活动 获得

|cffFFE799【成就属性】：|r
|cff00ff00+16.8   杀怪加全属性|r
|cff00ff00+16.8   攻击减甲|r
|cff00ff00+16.8%  杀敌数加成|r
|cff00ff00+16.8%  全伤加深|r

]],
need_map_level = 5,
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 16.8,
['攻击减甲'] = 16.8,
['杀敌数加成'] = 16.8,
['全伤加深'] = 16.8,
}
local mt = ac.skill['津津有味']
mt{
--等级
level = 1, 
--图标
art = [[yuanxiao2.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff通过 元宵活动 获得

|cffFFE799【成就属性】：|r
|cff00ff00+26.8   杀怪加全属性|r
|cff00ff00+26.8   攻击减甲|r
|cff00ff00+26.8%  杀敌数加成|r
|cff00ff00+26.8%  全伤加深|r

]],
need_map_level = 5,
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 26.8,
['攻击减甲'] = 26.8,
['杀敌数加成'] = 26.8,
['全伤加深'] = 26.8,
}
local mt = ac.skill['吃元宵不吐元宵皮']
mt{
--等级
level = 1, 
--图标
art = [[yuanxiao3.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff通过 元宵活动 获得

|cffFFE799【成就属性】：|r
|cff00ff00+36.8   杀怪加全属性|r
|cff00ff00+36.8   攻击减甲|r
|cff00ff00+36.8%  杀敌数加成|r
|cff00ff00+36.8%  全伤加深|r

]],
need_map_level = 5,
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 36.8,
['攻击减甲'] = 36.8,
['杀敌数加成'] = 36.8,
['全伤加深'] = 36.8,
}
local mt = ac.skill['饥不择食']
mt{
--等级
level = 1, 
--图标
art = [[yuanxiao4.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff通过 元宵活动 获得

|cffFFE799【成就属性】：|r
|cff00ff00+46.8   杀怪加全属性|r
|cff00ff00+46.8   攻击减甲|r
|cff00ff00+46.8%  杀敌数加成|r
|cff00ff00+46.8%  全伤加深|r

]],
need_map_level = 5,
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 46.8,
['攻击减甲'] = 46.8,
['杀敌数加成'] = 46.8,
['全伤加深'] = 46.8,
}
local mt = ac.skill['狼吞虎咽']
mt{
--等级
level = 1, 
--图标
art = [[yuanxiao5.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff通过 元宵活动 获得

|cffFFE799【成就属性】：|r
|cff00ff00+66.8   杀怪加全属性|r
|cff00ff00+66.8   攻击减甲|r
|cff00ff00+66.8%  杀敌数加成|r
|cff00ff00+66.8%  全伤加深|r

]],
need_map_level = 5,
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 66.8,
['攻击减甲'] = 66.8,
['杀敌数加成'] = 66.8,
['全伤加深'] = 66.8,
}
local yuanxiao_str = {
    '细嚼慢咽','津津有味','吃元宵不吐元宵皮','饥不择食','狼吞虎咽'
}


--=========================国庆活动=================================
local mt = ac.skill['我爱养花种树']
mt{
--等级
level = 0, 

--图标
art = [[wayhzs.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff国庆活动获得

|cffFFE799【成就属性】：|r
|cff00ff00+%杀怪加全属性%   |cff00ff00杀怪加全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%物品获取率% |cff00ff00% |cff00ff00物品获取率|r
|cff00ff00+%全伤加深% |cff00ff00% |cff00ff00全伤加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 8.8,
['攻击减甲'] = 8.8,
['物品获取率'] = 8.8,
['全伤加深'] = 8.8,
need_guoshi = 50,
need_map_level = 3,
}

local mt = ac.skill['果实累累']
mt{
--等级
level = 0, 

--图标
art = [[gsll.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff国庆活动获得

|cffFFE799【成就属性】：|r
|cff00ff00+%杀怪加全属性%   |cff00ff00杀怪加全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%木头加成% |cff00ff00% |cff00ff00木头加成|r
|cff00ff00+%全伤加深% |cff00ff00% |cff00ff00全伤加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 16.8,
['攻击减甲'] = 16.8,
['木头加成'] = 16.8,
['全伤加深'] = 16.8,

need_guoshi = 150,

need_map_level = 5,
}
local mt = ac.skill['辛勤的园丁']
mt{
--等级
level = 0, 

--图标
art = [[xqdyd.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff国庆活动获得

|cffFFE799【成就属性】：|r
|cff00ff00+%杀怪加全属性%   |cff00ff00杀怪加全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%火灵加成% |cff00ff00% |cff00ff00火灵加成|r
|cff00ff00+%全伤加深% |cff00ff00% |cff00ff00全伤加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 26.8,
['攻击减甲'] = 26.8,
['火灵加成'] = 26.8,
['全伤加深'] = 26.8,

need_guoshi = 350,

need_map_level = 7,
}

local mt = ac.skill['冷月葬花魂']
mt{
--等级
level = 0, 

--图标
art = [[lyzhh.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff国庆活动获得

|cffFFE799【成就属性】：|r
|cff00ff00+%杀怪加全属性%   |cff00ff00杀怪加全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%杀敌数加成% |cff00ff00% |cff00ff00杀敌数加成|r
|cff00ff00+%全伤加深% |cff00ff00% |cff00ff00全伤加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 32.8,
['攻击减甲'] = 32.8,
['杀敌数加成'] = 32.8,
['全伤加深'] = 32.8,

need_guoshi = 650,

need_map_level = 10,
}

local mt = ac.skill['园艺大师']
mt{
--等级
level = 0, 

--图标
art = [[yyds.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff国庆活动获得

|cffFFE799【成就属性】：|r
|cff00ff00+%杀怪加全属性%   |cff00ff00杀怪加全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%木头加成% |cff00ff00% |cff00ff00木头加成|r
|cff00ff00+%全伤加深% |cff00ff00% |cff00ff00全伤加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = 36.8,
['攻击减甲'] = 36.8,
['木头加成'] = 36.8,
['全伤加深'] = 36.8,

need_guoshi = 1350,

need_map_level = 13,
}

local mt = ac.skill['庆生蟠桃 ']
mt{
    is_spellbook = 1,
    is_order = 2,
    art = [[shoutao.blp]],
    title = '蟠桃成就',
    tip = [[

查看蟠桃成就
    ]],
    
}
mt.skills = {
    '我爱养花种树',
    '果实累累',
    '辛勤的园丁',
    '冷月葬花魂',
    '园艺大师',
}
function mt:on_add()
    local hero = self.owner 
    local player = hero:get_owner()

    local name = '庆生蟠桃'
    local has_mall = player.mall[name] or (player.cus_server and player.cus_server[name])

    for index,skill in ipairs(self.skill_book) do 
        local need_guoshi = skill.need_guoshi
        local map_level = player:Map_GetMapLevel()
        if has_mall and has_mall >= need_guoshi and map_level>=skill.need_map_level then 
            skill:set_level(1)
        end
    end 
 

end    

local mt = ac.skill['冰雪奇缘']
mt{
--等级
level = 1, --要动态插入
max_level = 5, --要动态插入
--图标
art = [[bingxueqiyuan.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【获得方式】：|r
|cff00ffff圣诞活动获得 |cffff0000重复完成可升级成就|r |cff00ffff最大等级=5

|cffFFE799【成就属性】：|r
|cff00ff00+%杀怪加全属性%   |cff00ff00杀怪加全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%木头加成% |cff00ff00% |cff00ff00木头加成|r
|cff00ff00+%会心伤害% |cff00ff00% |cff00ff00会心伤害|r

]],

--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = {8.8,17.6,26.4,35.2,44},
['木头加成'] = {8.8,17.6,26.4,35.2,44},
['攻击减甲'] = {8.8,17.6,26.4,35.2,44},
['会心伤害'] = {8.8,17.6,26.4,35.2,44},
need_map_level = 5,
}

local mt = ac.skill['傻子的春天']
mt{
--等级
level = 1, --要动态插入
max_level = 5,
--图标
art = [[szdct.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【获得方式】：|r
|cff00ffff圣诞活动获得 |cffff0000重复完成可升级成就|r |cff00ffff最大等级=5

|cffFFE799【成就属性】：|r
|cff00ff00+%杀怪加全属性%   |cff00ff00杀怪加全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%物品获取率% |cff00ff00%  |cff00ff00物品获取率|r
|cff00ff00+%暴击加深% |cff00ff00%  |cff00ff00暴击加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = {8.8,17.6,26.4,35.2,44},
['物品获取率'] = {8.8,17.6,26.4,35.2,44},
['攻击减甲'] = {8.8,17.6,26.4,35.2,44},
['暴击加深'] = {8.8,17.6,26.4,35.2,44},
need_map_level = 5,
}

local mt = ac.skill['兽魂之佑']
mt{
--等级
level = 1, --要动态插入
max_level = 5,
--图标
art = [[ruishou.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【获得方式】：|r
|cff00ffff春节活动获得 |cffff0000重复完成可升级成就|r |cff00ffff最大等级=5

|cffFFE799【成就属性】：|r
|cff00ff00+%杀怪加全属性%   |cff00ff00杀怪加全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%杀敌数加成% |cff00ff00%  |cff00ff00杀敌数加成|r
|cff00ff00+%暴击加深% |cff00ff00%  |cff00ff00暴击加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = {8.8,17.6,26.4,35.2,44},
['杀敌数加成'] = {8.8,17.6,26.4,35.2,44},
['攻击减甲'] = {8.8,17.6,26.4,35.2,44},
['暴击加深'] = {8.8,17.6,26.4,35.2,44},
need_map_level = 5,
}

local mt = ac.skill['放炮小达人']
mt{
--等级
level = 1, --要动态插入
max_level = 5,
--图标
art = [[zhadanren.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【获得方式】：|r
|cff00ffff春节活动获得 |cffff0000重复完成可升级成就|r |cff00ffff最大等级=5

|cffFFE799【成就属性】：|r
|cff00ff00+%杀怪加全属性%   |cff00ff00杀怪加全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%火灵加成% |cff00ff00%  |cff00ff00火灵加成|r
|cff00ff00+%技暴加深% |cff00ff00%  |cff00ff00技暴加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['杀怪加全属性'] = {8.8,17.6,26.4,35.2,44},
['火灵加成'] = {8.8,17.6,26.4,35.2,44},
['攻击减甲'] = {8.8,17.6,26.4,35.2,44},
['技暴加深'] = {8.8,17.6,26.4,35.2,44},
need_map_level = 5,
}

local mt = ac.skill['五福']
mt{
--等级
level = 1, --要动态插入
max_level = 1,
title ='五福活动奖励',
--图标
art = [[fuqi.blp]],
--说明
tip = [[ 
|cffffe799【成就说明】：|r
|cff00ff00通过|cffffff00“五福四海过福年”活动|cff00ff00获得，|cff00ff00集五福瓜分100亿的可存档全属性

|cffFFE799【成就属性】：|r
|cff00ff00+%全属性% |cff00ff00全属性|r

|cffcccccc您集齐了%wufu%|cffcccccc次五福，世界一共集齐|cffffff001103643|cffcccccc次五福]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
wufu = function(self)
    local p = self.owner.owner
    return math.min(p.cus_server['五福'],15*p:Map_GetMapLevel())
end,
['全属性'] = function(self)
    local v = math.floor( 10000000000 / 1103643 )
    return self.wufu * v
end,
need_map_level = 5,
}

local mt = ac.skill['九亿少女的梦']
mt{
--等级
level = 1, --要动态插入
max_level = 5,
--图标
art = [[shaonvmeng.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【获得方式】：|r
|cff00ffff情人节活动获得 |cffff0000重复完成可升级成就|r |cff00ffff最大等级=5

|cffFFE799【成就属性】：|r
|cff00ff00+%每秒加全属性%   |cff00ff00每秒加全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%杀敌数加成% |cffffff00%  |cff00ff00杀敌数加成|r
|cff00ff00+%会心伤害% |cffffff00%  |cff00ff00会心伤害|r
]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['每秒加全属性'] = {88,188,288,388,488},
['杀敌数加成'] = {8.8,13.8,18.8,23.8,28.8},
['攻击减甲'] = {8.8,13.8,18.8,23.8,28.8},
['会心伤害'] = {8.8,13.8,18.8,23.8,28.8},
need_map_level = 5,
}

local mt = ac.skill['纵享丝滑']
mt{
--等级
level = 1, 
max_level = 5, 
--图标
art = [[zongxiang.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【获得方式】：|r
|cff00ffff情人节活动获得 |cffff0000重复完成可升级成就|r |cff00ffff最大等级=5

|cffFFE799【成就属性】：|r
|cff00ff00+%每秒加全属性%   |cff00ff00每秒加全属性|r
|cff00ff00+%减少周围护甲%   |cff00ff00减少周围护甲|r
|cff00ff00+%每秒加木头%   |cff00ff00每秒加木头|r
|cff00ff00+%会心伤害% |cffffff00%  |cff00ff00会心伤害|r
]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['每秒加全属性'] = {88,188,288,388,488},
['每秒加木头'] = {1,2,3,4,5},
['减少周围护甲'] = {38,68,98,128,158},
['会心伤害'] = {8.8,13.8,18.8,23.8,28.8},
need_map_level = 5,
}

local mt = ac.skill['四月沙瓜']
mt{
--等级
level = 1, 
max_level = 5, 
--图标
art = [[siyueshagua.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff愚人节活动 获得，|cffff0000重复获得可升级成就|r |cff00ffff最大等级=5

|cffFFE799【成就属性】：|r
|cff00ff00+%攻击加全属性%   |cff00ff00攻击加全属性|r
|cff00ff00+%每秒加护甲%   |cff00ff00每秒加护甲|r
|cff00ff00+%物品获取率% |cffffff00%  |cff00ff00物品获取率|r
|cff00ff00+%物理伤害加深% |cffffff00%  |cff00ff00物理伤害加深|r
 ]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['攻击加全属性'] = {28,58,88,118,148},
['物品获取率'] = {8.8,13.8,18.8,23.8,28.8},
['物理伤害加深'] = {8.8,13.8,18.8,23.8,28.8},
['每秒加护甲'] = {1,2,3,4,5},
need_map_level = 5,
}



local mt = ac.skill['大智若鱼']
mt{
--等级
level = 1, 
max_level = 5, 
--图标
art = [[yurenjiadao.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【成就说明】：|r
|cff00ffff愚人节活动 获得，|cffff0000重复获得可升级成就|r |cff00ffff最大等级=5

|cffFFE799【成就属性】：|r
|cff00ff00+%攻击加全属性%  |cff00ff00攻击加全属性|r
|cff00ff00+%每秒加火灵%   |cff00ff00每秒加火灵|r
|cff00ff00+%每秒回血% |cffffff00%  |cff00ff00每秒回血|r
|cff00ff00+%技能伤害加深% |cffffff00%  |cff00ff00技能伤害加深|r
 ]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,

['攻击加全属性'] = {28,58,88,118,148},
['每秒回血'] = {1,2,3,4,5},
['技能伤害加深'] = {8.8,13.8,18.8,23.8,28.8},
['每秒加火灵'] = {2,4,6,8,10},
need_map_level = 5,
}


local mt = ac.skill['归梦五行图']
mt{
--等级
level = 1, 
max_level = 5, 
--图标
art = [[wuxingtu.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【获得方式】：|r
|cff00ffff劳动节活动获得 |cffff0000重复完成可升级成就|r |cff00ffff最大等级=5

|cffFFE799【成就属性】：|r
|cff00ff00+%攻击加全属性%   |cff00ff00攻击加全属性|r
|cff00ff00+%每秒加木头%   |cff00ff00每秒加木头|r
|cff00ff00+%减少周围护甲% |cff00ff00减少周围护甲|r
|cff00ff00+%技暴加深% |cffffff00%  |cff00ff00技暴加深|r
 ]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['攻击加全属性'] = {28,58,88,118,148},
['减少周围护甲'] = {100,200,300,400,500},
['技暴加深'] = {8.8,13.8,18.8,23.8,28.8},
['每秒加木头'] = {1,2,3,4,5},
need_map_level = 5,
}



local mt = ac.skill['放了那只猪']
mt{
--等级
level = 1, 
max_level = 5, 
--图标
art = [[mengchong.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【获得方式】：|r
|cff00ffff劳动节活动获得 |cffff0000重复完成可升级成就|r |cff00ffff最大等级=5

|cffFFE799【成就属性】：|r
|cff00ff00+%攻击加全属性%   |cff00ff00攻击加全属性|r
|cff00ff00+%每秒加杀敌数%   |cff00ff00每秒加杀敌数|r
|cff00ff00+%攻击减甲% |cff00ff00攻击减甲|r
|cff00ff00+%暴击加深% |cffffff00%  |cff00ff00暴击加深|r
 ]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,

['攻击加全属性'] = {28,58,88,118,148},
['攻击减甲'] = {10,20,30,40,50},
['暴击加深'] = {8.8,23.8,38.8,43.8,58.8},
['每秒加杀敌数'] = {1,2,3,4,5},
need_map_level = 5,
}

local mt = ac.skill['赤灵精品粽']
mt{
--等级
level = 1, --要动态插入
max_level = 5, --要动态插入
--图标
art = [[mljpz.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【获得方式】：|r
|cff00ffff端午节活动获得 |cffff0000重复完成可升级成就|r |cff00ffff最大等级=5

|cffFFE799【成就属性】：|r
|cff00ff00+%全属性%   |cff00ff00全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%每秒加护甲%   |cff00ff00每秒加护甲|r
|cff00ff00+%全伤加深% |cffffff00%  |cff00ff00全伤加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['全属性'] = {200000,250000,300000,350000,500000},
['攻击减甲'] = {20,25,30,35,50},
['每秒加护甲'] = {2,3,4,5,6},
['全伤加深'] = {10,12.5,15,17.5,25},
need_map_level = 5,
}


local mt = ac.skill['真正的学霸']
mt{
--等级
level = 1, --要动态插入
max_level = 5, --要动态插入
--图标
art = [[xueba.blp]],
--说明
tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【获得方式】：|r
|cff00ffff暑假活动获得 |cffff0000重复完成可升级成就|r |cff00ffff最大等级=5

|cffFFE799【成就属性】：|r
|cff00ff00+%全属性%   |cff00ff00全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%每秒加护甲%   |cff00ff00每秒加护甲|r
|cff00ff00+%技能伤害加深% |cffffff00%  |cff00ff00技能伤害加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['全属性'] = {200000,250000,300000,350000,500000},
['攻击减甲'] = {20,25,30,35,50},
['每秒加护甲'] = {2,3,4,5,6},
['技能伤害加深'] = {20,25,30,35,50},
need_map_level = 5,
}

local mt = ac.skill['赤灵麒麟瓜']
mt{
--等级
level = 1, --要动态插入
max_level = 5, --要动态插入
--图标
art = [[xigua.blp]],
--说明

tip = [[
|cffffff00【要求地图等级>%need_map_level%|cffffff00】|r

|cffffe799【获得方式】：|r
|cff00ffff暑假活动获得 |cffff0000重复完成可升级成就|r |cff00ffff最大等级=5

|cffFFE799【成就属性】：|r
|cff00ff00+%全属性%   |cff00ff00全属性|r
|cff00ff00+%攻击减甲%   |cff00ff00攻击减甲|r
|cff00ff00+%每秒加护甲%   |cff00ff00每秒加护甲|r
|cff00ff00+%物理伤害加深% |cffffff00%  |cff00ff00物理伤害加深|r

]],
--目标类型
target_type = ac.skill.TARGET_TYPE_NONE,
['全属性'] = {200000,250000,300000,350000,500000},
['攻击减甲'] = {20,25,30,35,50},
['每秒加护甲'] = {2,3,4,5,6},
['物理伤害加深'] = {40,50,60,70,100},
need_map_level = 5,
}


local mt = ac.skill['精彩活动']
mt{
    is_spellbook = 1,
    is_order = 2,
    art = [[jchd.blp]],
    title = '精彩活动',
    tip = [[

查看精彩活动
    ]],
    
}
mt.skill_name ={
    '缘定三生','井底之蛙','食物链顶端的人','有趣的灵魂',
    '蒙娜丽莎的微笑','四海共团圆','第一个吃螃蟹的人','庆生蟠桃 ',
    '傻子的春天','冰雪奇缘','兽魂之佑','放炮小达人','五福',
    '纵享丝滑','九亿少女的梦',
    '四月沙瓜','大智若鱼',
    '归梦五行图','放了那只猪',
    '赤灵精品粽',
    '真正的学霸','赤灵麒麟瓜',
}

mt.skills = {
    -- '第一个吃螃蟹的人',
}

function mt:on_add()
    local hero = self.owner 
    local player = hero:get_owner()
    for i=1,#self.skill_name do 
        local name = self.skill_name[i]
        local has_mall
        if  name == '庆生蟠桃 ' then 
            has_mall = player.mall['庆生蟠桃'] or (player.cus_server and player.cus_server['庆生蟠桃'])
        else 
            has_mall = player.mall[name] or (player.cus_server and player.cus_server[name]) or (player.cus_server2 and player.cus_server2[name]) 
        end
        if has_mall and has_mall > 0 then 
            ac.game:event_notify('技能-插入魔法书',hero,'精彩活动',name)
            local skl = hero:find_skill(name,nil,true)
            skl:set_level(has_mall)
        end
    end 
    --特殊处理 博饼活动
    local key = 'bobing'
    local server_value = player.cus_server and player.cus_server[ac.server.key2name(key)] or 0
    if server_value > 0 then 
        local name = bobing_str[server_value]
        ac.game:event_notify('技能-插入魔法书',hero,'精彩活动',name)
    end

    local key = 'yuanxiao'
    local server_value = player.cus_server and player.cus_server[ac.server.key2name(key)] or 0
    if server_value > 0 then 
        local name = yuanxiao_str[server_value]
        if name then 
            ac.game:event_notify('技能-插入魔法书',hero,'精彩活动',name)
        end
    end

    
end    
