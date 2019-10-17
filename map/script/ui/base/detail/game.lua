local hook = require 'jass.hook'
local japi = require 'jass.japi'
local message = require 'jass.message'
local error_handle = require('jass.runtime').error_handle
local dbg = require 'jass.debug'

local base
local left_is_down = false
local right_is_down = false
local is_active = true
local width,height = 0,0
local pointer



local game_event = {}


--事件函数名
local event_name = nil

--条件函数表 如果逻辑不成立 事件将不转发
local event_boolexpr = {}
--回调的事件表
local callback_table = nil

--绑定世界坐标的控件
local world_controls = {}

--事件回调
local function game_event_callback(name,...)

    local hash_table = {}
    for index,event_table in ipairs(game_event) do
        local func = event_table[name]
        if func ~= nil then 
            func(...)
        end 
    end
end


game.register_event = function(module)
    table.insert(game_event, module)
end


game.get_mouse_pos = function ()
    local x = japi.GetMouseVectorX() / 1024
    local y = (-(japi.GetMouseVectorY() - 768)) / 768 
    x = x * 1920
    y = y * 1080
    return x,y
end

game.set_mouse_pos = function (x,y)
    x = x / 1920 * 1024
    y = 768 - y / 1080 * 768
    japi.SetMousePos(x,y)
end 


--最后一个参数默认不用填
game.world_to_screen = function (x, y, z)
    local screen_x, screen_y, scale = message.world_to_screen(x, y, z)
    if  screen_x and screen_y then 
        return screen_x * 1920 / 0.8, screen_y * 1080 / 0.6, scale
    end 
end

game.screen_to_world = function (x, y)
    local screen_x, screen_y = x / 1920 * 0.8, y / 1080 * 0.6
    return message.screen_to_world(x, y)
end


game.bind_world = function (control, enable)
    if enable then 
        world_controls[control] = true
    else 
        world_controls[control] = nil
    end 
end 

function get_handle_type (handle)
    if handle == nil or handle == 0 then 
        return nil
    end 

    if GetHandleId(handle) == 0x100000 then 
        return nil 
    end

    local retval
    RemoveSavedHandle(ht,1,1)
    SaveFogStateHandle(ht,1,1,handle)
    if LoadItemHandle(ht,1,1) ~= nil and LoadItemHandle(ht,1,1) ~= 0 then 
        retval = 1
    elseif LoadUnitHandle(ht,1,1) ~= nil and LoadUnitHandle(ht,1,1) ~= 0 then
        retval = 2
    end
    RemoveSavedHandle(ht,1,1)
    return retval
end

ht = InitHashtable()

--创建一个异步运行的计时器 用来检测拖拽时间

game.wait(0,function ()
    base.on_init()
end)


--创建一个同步的计时器 来检测 窗口是否被激活
--如果不为激活 则响应鼠标弹起事件
game.loop(0.03,function ()
    local object = japi.GetTargetObject()
    if object ~= nil then 
        if object ~= pointer  then 
            local type = get_handle_type(pointer)

            if type == 1 then 
                base.on_item_mouse_leave(pointer)
                
            elseif type == 2 then 
                base.on_unit_mouse_leave(pointer)
            end
            type = get_handle_type(object)
            
            if type == 1 then 
                base.on_item_mouse_enter(object)
            elseif type == 2 then
                base.on_unit_mouse_enter(object)
            end
            pointer = object
        end
    end
    
    if japi.IsWindowActive() == false and is_active == true then 
        is_active = false
        if left_is_down or right_is_down then 
            base.on_mouse_up()
            base.on_mouse_right_up()
        end
    else
        is_active = true
    end
end)


--鼠标按下的时候 把响应的按钮收集起来 以便弹起的时候 来响应弹起事件
local left_button_list = {}
local right_button_list = {}

local event = {}

local function register_event(event_id,callback)
    event[event_id] = callback
end

local clock = os.clock()

--创建一个按钮 用来当做拖拽时的影子
local texture = nil
base = {
    
    on_mouse_down = function ()
        local id = japi.GetMouseFocus()
        local button = class.button.button_map[id]

        left_is_down = true
        if button ~= nil then
            
            event_callback('on_button_mousedown',button)
            table.insert(left_button_list,button)

            if button.is_drag == true then 
                
                width,height = button.w,button.h
                game.wait(0.15,function ()
                    if left_is_down == true then 
                        if texture ~= nil then 
                            base.on_mouse_up()
                        end

                        local x = japi.GetMouseVectorX() / 1024 * 1920
                        local y = (-(japi.GetMouseVectorY() - 768)) / 768 * 1080
                        x = x - button.w / 2
                        y = y - button.h / 2
                        texture = class.texture.create(button.normal_image,x,y,width,height)
                        texture.button = button
                        texture:set_alpha(100)
                        event_callback('on_button_begin_drag',button)
                    end
                end)

            end
        end

        game_event_callback('on_mouse_down') 
    end,

    on_mouse_up = function ()
        local id = japi.GetMouseFocus()
        local button = class.button.button_map[id]

        left_is_down = false
        if texture ~= nil then 
            if button == texture.button then 
                event_callback('on_button_drag_and_drop',texture.button)
            else
                event_callback('on_button_drag_and_drop',texture.button,button)
            end
            texture:destroy()
            texture = nil
        end 
        for index,object in ipairs(left_button_list) do
            if object ~= button then 
                event_callback('on_button_mouseup',object)
            else
                if object.is_enable then
                    event_callback('on_button_clicked',object)
                    local time = os.clock()
                    if object._click_time and time - object._click_time <= 0.3 then 
                        event_callback('on_button_double_clicked',object)
                    end 
                    object._click_time = time
                end
                event_callback('on_button_mouseup',object)
            end
            table.remove(left_button_list,index)
        end

        local handle = japi.GetTargetObject()
        local type = get_handle_type(handle)
        if type == 1 then 
            game_event_callback('on_item_clicked',handle)
        elseif type == 2 then 
            game_event_callback('on_unit_clicked',handle)
        end

        game_event_callback('on_mouse_up') 
    end,

    on_mouse_right_down = function ()
        local id = japi.GetMouseFocus()
        local button = class.button.button_map[id]

        right_is_down = true

        if button ~= nil then 
            event_callback('on_button_right_mousedown',button)
            table.insert(right_button_list,button)
        end 

    end,

    on_mouse_right_up = function ()
        local id = japi.GetMouseFocus()
        local button = class.button.button_map[id]

        right_is_down = false 

        for index,object in ipairs(right_button_list) do
            if object ~= button then 
                event_callback('on_button_right_mouseup',object)
            else
                event_callback('on_button_right_mouseup',object)
                event_callback('on_button_right_clicked',button)
            end
            table.remove(right_button_list,index)
        end

        local handle = japi.GetTargetObject()
        local type = get_handle_type(handle)
        if type == 1 then 
            game_event_callback('on_item_right_clicked',handle)
        elseif type == 2 then 
            game_event_callback('on_unit_right_clicked',handle)
        end

    end,

    on_mouse_move = function ()
        
        local x = japi.GetMouseVectorX() / 1024
        local y = (-(japi.GetMouseVectorY() - 768)) / 768 
        x = x * 1920
        y = y * 1080
        if texture ~= nil then 
            local button = texture.button
            texture:set_position(x - texture.w / 2,y - texture.h / 2)
            event_callback('on_button_update_drag',button,texture,x - button.w / 2,y - button.h / 2)
        end 

        for id,button in pairs(class.button.button_map) do
            local ox,oy = button:get_real_position()
        
            if x >= ox and  y >= oy and x <= ox + button.w and y <= oy + button.h then
                local is_show = button:get_is_show() ~= false
                if button.is_enter == nil and is_show then 
                    event_callback('on_button_mouse_enter',button)
                    button.is_enter = true
                end

                if button.is_enter and is_show and button.is_move_event then 
                    event_callback('on_button_mouse_move',button,x,y)
                end 
            elseif button.is_enter == true then 
                class.ui_base.remove_tooltip()
                event_callback('on_button_mouse_leave',button)
                button.is_enter = nil
            end
            
        end
    end,

    on_mouse_wheeldelta = function ()
        game_event_callback('on_mouse_wheeldelta',japi.GetWheelDelta() > 0)

        local x = japi.GetMouseVectorX() / 1024
        local y = (-(japi.GetMouseVectorY() - 768)) / 768 
        x = x * 1920
        y = y * 1080

        for id,panel in pairs(class.panel.panel_map) do
            local ox,oy = panel:get_real_position()
        
            if panel.enable_scroll 
            and x >= ox and  y >= oy 
            and x <= ox + panel.w and y <= oy + panel.h 
            then
                local bool = japi.GetWheelDelta() > 0
                local y = panel.scroll_y or 0
                if bool then 
                    if y > 0 then 
                        y = y - (panel.scroll_interval_y  or 10)
                    end 
                else 
                    if y + panel.h < panel:get_child_max_y() then 
                        y = y +  (panel.scroll_interval_y or 10)
                    end 
                end 
                panel.scroll_y = y
                event_callback('on_panel_scroll',panel,bool)
                event_callback('on_panel_scroll_fix',panel,bool)
                
            end 
        end 
    end,

    on_key_down = function ()
        game_event_callback('on_key_down',japi.GetTriggerKey()) 
    end,

    on_key_up = function ()
        game_event_callback('on_key_up',japi.GetTriggerKey())
    end,

    --指向物品事件
    on_item_mouse_enter = function (item_handle)
        game_event_callback('on_item_mouse_enter',item_handle)
        --print('进入物品',item_handle)
    end,

    --离开物品事件
    on_item_mouse_leave = function (item_handle)
        game_event_callback('on_item_mouse_leave',item_handle)
        --print('离开物品',item_handle)
    end,

    --指向单位事件
    on_unit_mouse_enter = function (unit_handle)
        game_event_callback('on_unit_mouse_enter',unit_handle)
        --print('进入单位',unit_handle)
    end,
 
    --离开单位事件
    on_unit_mouse_leave = function (unit_handle)
        game_event_callback('on_unit_mouse_leave',unit_handle)
        --print('离开单位',unit_handle)
    end,

   
    on_update_window_size = function ()
        game_event_callback('on_update_window_size')
    end,


    
    on_update = function ()
        local c = os.clock()
        local delta = c - clock 
        clock = c 

        base.on_mouse_move()
        game_event_callback('on_update', delta)

        for control in pairs(world_controls) do 
            local unit = control.world_unit 
            
            local x, y, z 

            if unit then 
                if unit.removed then
                    control:destroy()
                    goto continue
                else 
                    if (not unit:is_alive()) or unit:has_restriction '隐藏' then 
                        control:hide()
                        goto continue
                    else 
                        x, y, z = unit:get_point():get()
                        z = z + message.unit_overhead(unit.handle)
                    end 
                end 
            else 
                x, y, z = control.x, control.y, control.z
            end 
            local screen_x, screen_y, scale = game.world_to_screen(x, y, z)
            
            if screen_x == nil or screen_x < 0 or screen_y < 32 or screen_x > 1920 or screen_y > 820 then 
                control:hide()
            else 
                control:show()
                control:set_position(screen_x - control.w / 2, screen_y - control.h / 2)
                control:set_relative_size(scale, true)
            end 

            ::continue::
        end 
    end,


    on_init = function()
        game_event_callback('on_init')
    end,

}

register_event(1,base.on_mouse_down)
register_event(2,base.on_mouse_up)
register_event(3,base.on_mouse_right_down)
register_event(4,base.on_mouse_right_up)
register_event(5,base.on_mouse_move)
register_event(6,base.on_mouse_wheeldelta)
register_event(7,base.on_key_down)
register_event(8,base.on_key_up)
register_event(9,base.on_update_window_size)
register_event(10,base.on_update)




function WindowEventCallBack(event_id)

    if event[event_id] ~= nil then 
        xpcall(event[event_id],error_handle)
    end 
end



local frame_event = {
    --文本框更新事件
    [9] = function (frame,id)
        local input = input_class.input_map[frame]
        if input == nil then 
            return 
        end 

        local text = input:get_text()
        if input.text ~= text then 
            local old_text = input.text
            input.text = text
            event_callback('on_input_text_changed',input,text,old_text)
        end 
    end,
}

function FrameEventCallBack(frame,id)
    if frame_event[id] then 
        xpcall(frame_event[id],runtime.error_handle,frame,id)
    end 
end 


return game