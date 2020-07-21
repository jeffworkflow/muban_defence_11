

require '测试.memory_test'
-- require '测试.memory_test2'
require '测试.游戏模块'
if global_test then
    require '测试.helper'
end    





local ok,effect_file = pcall(require, '测试.effect_file')
-- print(pcall(require, '测试.effect_file'))
--进入测试特效模式
ac.effect_file = effect_file
if ok then 
    print_r(effect_file)
    ac.wait(10*1000,function()
        local iy = 0
        local temp = {}
        for i,name in ipairs(effect_file) do
            ac.wait(iy*5*1000,function()
                --先移除上次的，再创建新的
                print('开始测试模型：',name,i)
                for i,eff in ipairs(temp) do 
                    eff:remove()
                end
                temp = {} --清空
                --插入新的
                for ix=1,1000 do 
                    local eff = ac.effect_ex{
                        model = name,
                        point = ac.map.rects['主城']:get_point() or ac.point(0,0)
                    }
                    table.insert(temp,eff)
                end
            end)
            iy = iy + 1
        end
    end)
end
