
require 'ui.client.util'
require 'ui.client.actor'
ac.ui = {}
ac.ui.client = {}
ac.ui.server = {}
ac.ui.client.panel = class.panel.create('', 0, 0, 1920, 1080)
-- require 'ui.client.sendmsg'
-- require 'ui.client.tip'
-- require 'ui.client.kzt'
require 'ui.client.提示框'
require 'ui.client.控制台'
require 'ui.client.英雄属性'
require 'ui.client.存档信息'
require 'ui.client.属性面板'

require 'ui.client.菜单'
require 'ui.client.全屏提醒'

require 'ui.client.sync'

--覆盖整个屏幕的面板