-- looks to see if any tunX interfaces are UP



local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

local update_interval = 5 -- in seconds

-- local vpn_widget = wibox.widget.textbox("")
local vpn_widget = wibox.widget.textbox("\u{f023}")

local function update_widget(colour)
  vpn_widget.markup = "<span foreground='" .. colour .. "'>" .. vpn_widget.text .. "</span>"
  -- vpn_widget:connect_signal("widget::redraw_needed", function ()
  --   vpn_widget.markup = "<span foreground='" .. colour .. "'>" .. vpn_widget.text .. "</span>"
  -- end)
end

local tun_status_script = [[
  bash -c "
  ip link show|grep -E \"tun[0-9]+.*[<,]UP[,>]\"
  "]]

awful.widget.watch(tun_status_script, update_interval, function(widget, stdout, stderr, exitreason, exitcode)
  if exitcode == 0 then
    update_widget(beautiful.xcolor2)
  else
    update_widget(beautiful.xcolor1)
  end
end)

return vpn_widget
