-- count available package updates (using yay and pacman)
-- NOTE: need to be able to run "sudo pacman -Sy" without a password.

local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

local pacman_interval = 3600 -- in seconds
local yay_interval = 60 -- in seconds

local yay_count_widget = wibox.widget.textbox()

local function update_widget(count)
  local colour
  local text
  if count < 0 then
    colour = beautiful.xcolor9
    text = "Err"
  elseif count == 0 then
    colour = beautiful.xcolor7
    text = "No Updates"
  else
    colour = beautiful.xcolor3
    text = count .. " updates"
  end
  yay_count_widget.markup = "<span foreground='" .. colour .. "'>" .. text .. "</span>"
end

gears.timer {
  timeout = pacman_interval,
  call_now = true,
  autostart = true,
  callback = function()
    awful.spawn("sudo pacman -Sy")
  end
}

awful.widget.watch("yay -Pn", yay_interval, function(widget, stdout, stderr, exitreason, exitcode)
  if exitcode == 0 then
    update_widget(tonumber(stdout))
  else
    update_widget(-1)
  end
end)

return yay_count_widget
