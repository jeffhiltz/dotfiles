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

return public_ip_widget
