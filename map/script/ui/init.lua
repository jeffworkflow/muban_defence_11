mtp_tip ={}
require 'ui.base'
require 'ui.base_ex'
require 'ui.client'
require 'ui.server'



-- local ui            = require 'ui.client.util'
-- local json = require 'util.json'
-- local player = require 'ac.player'

-- function player.__index:test_send_message()
--     local info = {
--         type = 'cus_1',
--         func_name = 'test_send',
--         params = {
--             [1] = '12131',
--         }
--     }
--     ui.send_message(info)
-- end    


-- local ui = require 'ui.server.util'
-- --处理同步请求
-- local event = {
--     --从自定义服务器读取数据
--     test_send = function (tab_str)
--         local player = ui.player   
--         print(111111111,player,tab_str)
--         player:event_notify('读取存档数据')

--     end,
-- }
-- ui.register_event('cus_1',event)

-- for i=1,10 do
--     local player = ac.player[i]
--     if player:is_player() then
--         if player:is_self() then 
--             player:test_send_message()
--         end    
--     end
-- end

