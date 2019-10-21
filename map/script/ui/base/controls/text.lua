require 'ui.base.controls.class'
require 'ui.base.controls.panel'

local font = [[
    Frame "TEXT" "text%d" {
        LayerStyle "IGNORETRACKEVENTS",
        FrameFont "resource\fonts\fonts.ttf", %f, "",
    }
]]


local font_map = {}

local function load_font(font,size)
    if font_map[size] ~= nil then 
        return 
    end
    size = math.modf(size)
    font_map[size] = 1
    local data = string.format(font,size,size/1000)
    load_fdf(data)
end


class.text = extends(class.panel){

    --文字 类型 和 基类
    _type   = 'text',
    _base   = 'TEXT',

    text_map = {},

    align_map = {
        --自动换行
        auto_newline     = -1,
        auto_size        = -2,

        topleft         = 0,
        top             = 1,
        topright        = 2,
        left            = 3,
        center          = 4,
        right           = 5,
        bottomleft      = 6,
        bottom          = 7,
        bottomright     = 8,
    },

    -- parent 当 create的时候是空值 add_text的时候是父控件
    -- text 字符串 文本值
    -- x,y,w,h 坐标位置
    -- font_size 字体大小
    -- align 
    new = function (parent,text,x,y,width,height,font_size,align)
        font_size = font_size or 16
        local ui = class.ui_base.create('text',x,y,width,height)

        ui.align = class.text.align_map[align] or 0
        ui.font_size = font_size
        ui.__index = class.text

        if ui.text_map[ui._name] ~= nil then 
            class.ui_base.destroy(ui)
            print('文字创建失败 字符串id已经存在')
            return 
        end 

        local panel = class.panel.new(parent,'',0,0,width,height)

        if panel == nil then 
            print('文字背景创建失败')
            return
        end
        panel._control = ui
        ui._panel = panel 

        
        if type(font_size) == 'boolean' then 
            ui._type = 'old_text'
        else
            load_font(font,font_size)
            ui._type = string.format('%s%d',ui._type,font_size)
        end
        --ui._type = string.format('%s%d',ui._type,font_size)


        ui.id = japi.CreateFrameByTagName( ui._base, ui._name, panel.id, ui._type,math.max(0,ui.align))
        if ui.id == nil or ui.id == 0 then 
            panel:destroy()
            class.ui_base.destroy(ui)
            print('创建文字失败')
            return 
        end

        ui.text_map[ui._name] = ui
        ui.text_map[ui.id] = ui
        ui.parent = parent

        
        ui:set_text(text)
        --ui:set_size(1)
        ui:set_position(x,y)
        ui:set_control_size(width,height)
        return ui
    end,

    destroy = function (self)
        if self.id == nil or self.id == 0 then 
            return 
        end
        self._panel:destroy()
 
        self.text_map[self.id] = nil 
        self.text_map[self._name] = nil

        class.ui_base.destroy(self)
    end,

    show = function (self)
        self._panel:show()
        class.ui_base.show(self)
    end,

    hide = function (self)
        self._panel:hide()
        class.ui_base.hide(self)
    end,

    get_width = function (self)
        return japi.FrameGetTextWidth(self.id) / 0.8 * 1920
    end,

    get_height = function (self)
        return japi.FrameGetTextHeight(self.id) / 0.6 * 1080
    end,

    set_text = function (self,text)
        if text ~= self:get_text() then 
            japi.FrameSetText(self.id,text)
        end    

        if self.align == -2 then 
            local id = self._panel.id 

            local width = self:get_width()
            local height = self:get_height()

            if width > 0 and height > 0 then 
                self:set_control_size(width,height)
                if self.parent then 
                    self.parent:set_control_size(width,height)
                end 
            end 
        elseif self.normal_image ~= 'Transparent.tga' then
            --game.wait(100, function ()
            --    if self.id then 
            --        local width = self:get_width()
            --        local height = self:get_height()
            --        if width > 0 and height > 0 then 
            --            self:set_control_size(width,height)
            --        end 
            --    end 
            --end)
        end 
    end,

    get_text = function (self)
        return japi.FrameGetText(self.id)
    end,

    --设置间距 
    set_spacing = function (self,spacing)
        japi.FrameSetTextFontSpacing(self.id,spacing)
    end,

    set_size = function (self,size,path)
 
        local real_size = size * self.font_size * (self.relative_size or 1) * (self.default_size or 1)
        self.size = size 

        path = path or 'C:\\Windows\\Fonts\\simhei.ttf'

        if self._real_size == real_size and self.path == path then 
            return 
        end 

        self._real_size = real_size 
        self.font_path = path 
        --path = path or 'resource\\Fonts\\FZHTJW.ttf'
  
        japi.FrameSetTextFont(self.id,path,real_size / 1000)
    end,

    set_color = function (self,...)
        local arg = {...}
        local color =0
        if #arg == 1 then 
            color = arg[1]
            local a = (color << 32) >> 56
            local r = (color << 40) >> 56
            local g = (color << 48) >> 56
            local b = (color << 56) >> 56
            self.color = {r = r,g = g,b = b,a = a/0xff}
        else 
            local r,g,b,a = table.unpack(arg)
            self._panel:set_alpha(a)
            self.color = {r = r,g = g,b = b,a = a}            
            color = 255 * 0x1000000 + r * 0x10000 + g * 0x100 + b
        end
        japi.FrameSetTextColor(self.id,color)
    end,

    set_alpha = function (self,alpha)
        local r,g,b = 255,255,255
        if self.color then 
           r = self.color.r 
           g = self.color.g 
           b = self.color.b 
        end 
        if alpha < 0 then 
            alpha = 0 
        end 
        self:set_color(r,g,b,alpha)
    end,
    set_control_size = function (self,width,height)
        
        self.w = width 
        self.h = height
      
        if self.align == -1 then 
            class.panel.set_control_size(self,width,height)
        end
        self._panel:set_control_size(width,height)
    end,

    set_position = function (self,x,y)
        class.ui_base.set_position(self,x,y)
        self._panel:set_position(x,y)
    end,

    set_normal_image = function (self,path,flag)
        self._panel:set_normal_image(path,flag)
    end,

}
local mt = getmetatable(class.text)

mt.__tostring = function (self)
    local str = string.format('文本 %d',self.id or 0)
    return str
end

