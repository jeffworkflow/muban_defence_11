-- local Base64 = require 'ac.Base64'
local japi = require 'jass.japi'
local player = require 'ac.player'
ac.server ={}
--读取玩家的商城道具
local item = {
    {'JBLB','金币礼包'},
    {'MCLB','木材礼包'},
    {'YJZZ','永久赞助'},
    {'YJCJZZ','永久超级赞助'},
    {'HDJ','皇帝剑'},
    {'HDD','皇帝刀'},
    {'JSYYY','绝世阳炎翼'},
    {'LHHMY','轮迴幻魔翼'},
    {'XLSF','限量首充'},
    {'SCDLB','首充大礼包'},

    {'GL','骨龙'},
    {'XWK','小悟空'},

    {'YXZZB','至尊宝'},
    {'YXGL','鬼厉'},
    {'YXJX','剑仙'},
    {'YXZSB','剑仙直升包'},

    {'SXS','神仙水'},
    {'SZDLB','神装大礼包'},
    {'SJDLB','神技大礼包'},
    {'XBXFX','寻宝小飞侠'},
    
    {'GFQLLY','孤风青龙领域'},
    {'YYCLLY','远影苍龙领域'},

    {'ZLTZ','真龙天子'},
    {'QTDS','齐天大圣A'},
    {'QTDSB','齐天大圣B'},

    {'BBDLB','百变英雄礼包'},
    {'SJBCLB','赛季补偿礼包'},

    --key,key_name,地图等级要求
    {'WXHP','五星好评礼包',3},
    {'XHB','夏侯霸',5},
    {'YJ','虞姬',10},
    {'TJXM','太极熊猫',15},
    {'DRJ','狄仁杰',25},
    {'YND','伊利丹',32},

    {'hjblj','惊虹奔雷剑',20},
    {'xyxyy','玄羽绣云翼',30},
    
    {'ltly','龙腾领域',13},
    {'fsrlly','飞沙热浪领域',17},
    {'lxytly','灵霄烟涛领域',22},

    {'fxlhj','飞星雷火剑',26},
    {'byjhy','白羽金虹翼',28},

    {'gg','关公',35},
    {'jbl','加百列',42},
    {'cxwxly','赤霞万象领域',37},
    
-- {'gd','肝帝',60},
    
    
}   



--@设计 从网易读取并保存到map_test 只有商城、地图等级。
--  字段需要
--  1.段位记录对应通关次数:  cnt_qt  cnt_bj .. 8个段位; 后续有对应的排名， 排名可能有对应的奖励
--  2.永久性的物品:
--     a.武器：霸王莲龙锤 惊虹奔雷剑 幻海雪饮剑
--     b.翅膀：... 
--     c.称号：...
--  3.挖宝积分，神龙碎片
--  4.宠物皮肤 
local cus_key = {
    --以下自定义服务器 key value
    {'cnt_qt','青铜'},
    {'cnt_by','白银'},
    {'cnt_hj','黄金'},
    {'cnt_bj','铂金'},
    {'cnt_zs','钻石'},
    {'cnt_xy','星耀'},
    {'cnt_wz','王者'},
    {'cnt_zqwz','最强王者'},
    {'cntrywz','荣耀王者'},
    {'cntdfwz','巅峰王者'},
    --10

    {'cntpkms','武林大会'}, -- 星数
    

    {'cntwxld','无限乱斗'}, 
    {'wjwxld','无限乱斗无尽'}, -- 无尽层数最高值
    {'ljwjwxld','无限乱斗无尽累计'},-- 无尽层数累计值


    {'cntxlms','修罗模式'}, -- 星数
    {'wjxlms','修罗模式无尽'}, -- 无尽层数最高值
    {'ljwjxlms','修罗模式无尽累计'},-- 无尽层数累计值
    
    {'cntdpcq','斗破苍穹'}, -- 星数
    {'wjdpcq','斗破苍穹无尽'}, -- 无尽层数最高值
    {'ljwjdpcq','斗破苍穹无尽累计'},-- 无尽层数累计值

    {'cntwszj','无上之境'},
    {'wjwszj','无上之境无尽'}, -- 无尽层数最高值
    {'ljwjwszj','无上之境无尽累计'},-- 无尽层数累计值

    
    {'cntsyld','深渊乱斗'}, 
    {'wjsyld','深渊乱斗无尽'}, -- 无尽层数最高值
    {'ljwjsyld','深渊乱斗无尽累计'},-- 无尽层数累计值

    {'time_qt','青铜时长'},
    {'time_by','白银时长'},
    {'time_hj','黄金时长'},
    {'time_bj','铂金时长'},
    {'time_zs','钻石时长'},
    {'time_xy','星耀时长'},
    {'time_wz','王者时长'},
    {'time_zqwz','最强王者时长'},
    {'time_rywz','荣耀王者时长'},
    {'time_dfwz','巅峰王者时长'},
    {'time_xlms','修罗模式时长'},
    {'time_dpcq','斗破苍穹时长'},
    {'time_wszj','无上之境时长'},
    {'time_wxld','无限乱斗时长'},
    {'time_syld','深渊乱斗时长'},
    {'time_pkms','武林大会时长'},

    
    {'today_wjxlms','今日修罗模式无尽'},
    {'today_wjxlmsrank','今日修罗模式无尽排名'},
    {'today_wjdpcq','今日斗破苍穹无尽'},
    {'today_wjdpcqrank','今日斗破苍穹无尽排名'},
    {'today_wjwszj','今日无上之境无尽'},
    {'today_wjwszjrank','今日无上之境无尽排名'},

    {'today_wjwxld','今日无限乱斗无尽'},
    {'today_wjwxldrank','今日无限乱斗无尽排名'},

    {'today_wjsyld','今日深渊乱斗无尽'},
    {'today_wjsyldrank','今日深渊乱斗无尽排名'},

    {'bwllc','霸王莲龙锤'},

    {'hhxyj','幻海雪饮剑'},
    
    {'mdxy','梦蝶仙翼'},

    {'tgcyy','天罡苍羽翼'},


    {'lysxy','龙吟双形翼'},
    {'jlsxy','金鳞双型翼'},
    {'cmsxy','赤魔双形翼'},
    
    {'sbkd','势不可挡'},
    --记得添加


    {'lhcq','炉火纯青'},
    {'htmd','毁天灭地'},
    {'dfty','风驰电掣'},
    {'jltx','君临天下'},
    {'jstj','无双魅影'},
    {'sd','神帝'},
    {'wzgl','傲世天下'},
    --4

    -- {'nsl','耐瑟龙'},
    {'bl','冰龙'},

    -- {'jll','精灵龙'},

    -- {'qml','奇美拉'},

    {'my','魅影'},
    {'zsyhly','紫霜幽幻龙鹰'},

    {'tmxk','天马行空'},
    

    -- {'spnsl','耐瑟龙碎片'},
    -- {'spbl','冰龙碎片'},
    -- {'spjll','精灵龙碎片'},
    -- {'spqml','奇美拉碎片'},
    -- {'spmy','魅影碎片'},
    -- {'spzsyhly','紫霜幽幻龙鹰碎片'},
    

    {'zzl','赵子龙'},
    -- {'zzl','赵子龙'},
    
    {'pa','Pa'},
    {'xln','手无寸铁的小龙女'},
    {'gy','关羽'},

    {'wzj','王昭君'},

    -- {'sppa','Pa碎片'},
    -- {'spxln','手无寸铁的小龙女碎片'},
    -- {'spgy','关羽碎片'},

    -- {'spbwllc','霸王莲龙锤碎片'},
    -- {'spmdxy','梦蝶仙翼碎片'},

    {'wbjf','挖宝积分'},
    {'cwtf','宠物天赋'},
    {'yshz','勇士徽章'},
    --17

    {'dhll','力量'},
    {'dhmj','敏捷'},
    {'dhzl','智力'},
    {'dhqsx','全属性'},
    --21

    {'sjjh','杀鸡儆猴'},
    --22

    {'xwly','血雾领域'},

    {'gjjj','攻击减甲'},
--23
    
    {'zsas','紫色哀伤'},
    {'blnsy','白龙凝酥翼'},

    {'szas','霜之哀伤'},

    {'fthj','方天画戟'},
    {'sswsj','圣神无双剑'},
    {'mszxj','灭神紫霄剑'},

    {'tszg','天使之光'},
    {'byshly','白云四海领域'},
    {'zwqyly','真武青焰领域'},
    

    {'jhxx','江湖小虾'},
    {'mrzx','明日之星'},
    {'wlgs','武林高手'},
    {'jsqc','绝世奇才'},
    {'wzsj','威震三界'},
    

    {'wljf','比武积分'},
--24

--27 
    
    {'lhjyly','烈火金焰领域'},  
    -- {'lhjyly','烈火金焰领域'},  
    {'hsslly','烈火天翔领域'},
    -- {'hsslly','烈火天翔领域'},


    
    {'yqdlh','有趣的灵魂'},

    {'cntwb','挖宝'},
    {'today_cntwb','今日挖宝'},
    {'today_cntwbrank','今日挖宝排名'},
    
    {'cntwl','比武'},
    {'today_cntwl','今日比武'},
    {'today_cntwlrank','今日比武排名'},



    {'ydn','雅典娜'},

    
    {'ntgm','逆天改命'},
    {'qcfh','七彩凤凰'},
    {'lsywly','罗刹夜舞领域'},
    -- {'ntgm','逆天改命'},
    -- {'qcfh','七彩凤凰'},
    -- {'lsywly','罗刹夜舞领域'},

    {'szdct','傻子的春天'},
    {'bxqy','冰雪奇缘'},

    {'wxboss','无限BOSS'},
    {'jsmj','绝世魔剑'},

    {'today_wxboss','今日无限BOSS'},
    {'today_wxbossrank','今日无限BOSS排名'},
    
    {'wf','五福'},--五福收集次数
    {'wf2','五福2',type = '存档'},--五福收集次数
    {'sjwf','世界五福'},--世界五福收集次数

    {'shzy','兽魂之佑'},--
    {'fpxdr','放炮小达人'},--
    {'yuanxiao','元宵'},
    {'wzj','王昭君'},
    
    {'jysndm','九亿少女的梦'},
    {'zxsh','纵享丝滑'},
    {'sfzb','顺风装备'},
    {'sysg','四月沙瓜'},
    {'dzry','大智若鱼'},
    
    {'gmwxt','归梦五行图'},
    {'flnzz','放了那只猪'},
    {'cljpz','赤灵精品粽'},
    
    {'zzdxb','真正的学霸',type = '存档'},
    {'clqlg','赤灵麒麟瓜',type = '存档'},
    {'ydss','缘定三生',type = '存档'},

    {'hdshgty','四海共团圆',type = '存档'},
    {'hddygcpx','第一个吃螃蟹的人',type = '存档'},
    {'bobing','博饼',type = '存档'},

    
    {'cdwq','存档武器',type = '存档'},
    {'cdyd','存档腰带',type = '存档'},
    {'cdxz','存档鞋子',type = '存档'},
    {'cdyf','存档衣服',type = '存档'},
    {'cdtk','存档头盔',type = '存档'},
    {'cdst','存档手套',type = '存档'},
}


--11存档信息
if record_11 then 
    item = {
        {'vip','满赞'},
        {'tz','天尊'},
        {'20000956','金币礼包'},
        {'20000955','木材礼包'},
        {'20000939','永久赞助'},
        {'20000936','永久超级赞助'},
        {'20000945','皇帝剑'},
        {'20000944','皇帝刀'},
        {'20000942','绝世阳炎翼'},
        {'20000947','轮迴幻魔翼'},
        -- {'XLSF','限量首充'},
        {'20000937','首充大礼包'},
    
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
        {'20001056','齐天大圣'},
        -- {'QTDSB','齐天大圣B'},


        {'20000935','百变英雄礼包'},
        -- {'SJBCLB','赛季补偿礼包'},
        {'20004216','寻宝大飞侠'},
        
        --key,key_name,地图等级要求
        {'WXHP','五星好评礼包',3},
        {'XHB','夏侯霸',5},
        {'YJ','虞姬',10},
        {'TJXM','太极熊猫',15},
        {'DRJ','狄仁杰',25},
        {'YND','伊利丹',32},

        {'hjblj','惊虹奔雷剑',20},
        {'xyxyy','玄羽绣云翼',30},
        
        {'ltly','龙腾领域',13},
        {'fsrlly','飞沙热浪领域',17},
        {'lxytly','灵霄烟涛领域',22},
    
        {'fxlhj','飞星雷火剑',26},
        {'byjhy','白羽金虹翼',28},
    
        {'gg','关公',35},
        {'jbl','加百列',42},
        {'cxwxly','赤霞万象领域',37},
        
    -- {'gd','肝帝',60},
    }
    -- print(item[1][1],item[1][2],ac.player(1):Map_HasMallItem(item[1][1]))
    table.insert(cus_key,{'exp','地图经验'})
    table.insert(cus_key,{'level','地图等级'})
    -- print(ac.player(1):Map_GetServerValue('sjjh'))
end 

ac.cus_server_key = cus_key
ac.mall = item 

--通过key取 name 和 是否商城道具
function ac.server.key2name(key)
    local res
    local type
    --取自定义key,value
    for i,v in ipairs(ac.cus_server_key) do 
        if v[1] == key then 
            res = v[2]
            type = v.type
            break
        end
    end  
    --取自定义key,value)
    for i,v in ipairs(ac.mall) do 
        if v[1] == key then 
            res = v[2]
            type = v.type
            break
        end
    end   
    return  res,type
end  
--通过 name 取 key
function ac.server.name2key(name) 
    local res
    local type 
    --取自定义key,value
    for i,v in ipairs(ac.cus_server_key) do 
        if v[2] == name then 
            res = v[1]
            type = v.type
            break
        end
    end  
    --取自定义key,value
    for i,v in ipairs(ac.mall) do 
        if v[2] == name then 
            res = v[1]
            type = v.type
            break
        end
    end  
    return  res,type
end
--加积分
function player.__index:add_jifen(value)
    player.jifen = player.jifen + tonumber(value)
    -- player:SetServerValue('jifen',player.jifen) 自定义服务器
    player:Map_SaveServerValue('jifen',player.jifen)  --网易服务器
end    

--网易服务器存档读取
function ac.get_server(p,key)
    local value,key_name,type
    key_name,type = ac.server.key2name(key)
    if tonumber(type) == 1 and p:Map_HasMallItem(key) then 
        value = 1
	else	
		value = p:Map_GetServerValue(key)
    end	
    return value,key_name,type
end	

