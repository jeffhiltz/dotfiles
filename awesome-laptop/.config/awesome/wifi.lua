-- get ssid name and wifi strength

local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

local interval = 10 -- in seconds
local interface = "wlp0s20f3" -- TODO hard-coded interface name...

local widget = wibox.widget.textbox()

local function update_widget(name, strength)
  local ssid_colour = beautiful.xcolor7
  local strength_colour
  local text
  if strength <= 50 then
    strength_colour = beautiful.xcolor1
  elseif strength < 70 then
    strength_colour = beautiful.xcolor3
  else
    strength_colour = beautiful.xcolor7
  end
  widget.markup = "<span foreground='" .. ssid_colour .. "'>\u{faa8} " .. name .. "</span> <span foreground='" .. strength_colour .. "'>" .. strength .. "%</span>"
end

local script = [[
  bash -c "
  iw ]] .. interface .. [[ info | awk '/ssid/ {print $2}' &&
  grep ]] .. interface .. [[ /proc/net/wireless | awk '{ print int($3 * 10 / 7) }'
  "]]

awful.widget.watch(script, yay_interval, function(widget, stdout, stderr, exitreason, exitcode)
  gears.debug.print_warning(stdout)
  name, raw_strength = string.match(stdout, "([^\n]*)\n(%d+)")
  strength = tonumber(raw_strength)
  gears.debug.print_warning(exitcode)
  if exitcode == 0 and strength ~= nil then
    update_widget(name, strength)
  else
    update_widget("ERR", exitcode)
  end
end)

return widget
