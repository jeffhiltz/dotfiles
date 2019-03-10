local awful = require("awful")
local wibox = require("wibox")

local update_interval = 5 -- in seconds

local public_ip_widget = wibox.widget.textbox()

local function update_widget(public_address)
	public_ip_widget:set_text(public_address)
end

local public_address_script = [[
  bash -c "
  dig +short myip.opendns.com @resolver1.opendns.com
  "]]

awful.widget.watch(public_address_script, update_interval, function(widget, stdout)
  local public_address = stdout
  update_widget(public_address)
end)

-- How to apply theme colours in a widget:
-- local beautiful = require("beautiful")
-- public_ip_widget.markup = "<span background='" .. beautiful.bg_urgent .. "'>" .. public_ip_widget.text .. "</span>"
-- public_ip_widget:connect_signal("widget::redraw_needed", function ()
--   public_ip_widget.markup = "<span background='" .. beautiful.bg_urgent .. "'>" .. public_ip_widget.text .. "</span>"
-- end)

return public_ip_widget
