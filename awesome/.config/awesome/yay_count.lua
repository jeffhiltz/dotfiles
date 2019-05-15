-- count available package updates (using yay and pacman)

local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

local update_interval = 3600 -- in seconds

local yay_count_widget = wibox.widget.textbox()

local function update_widget(count)
  local colour = count > 0 and beautiful.xcolor3 or beautiful.xcolor7
  yay_count_widget.markup = "<span foreground='" .. colour .. "'>" .. count .. "</span>"
end

local tun_status_script = [[
  bash -c "
  sudo pacman -Sy && yay -Pn
  "]]

awful.widget.watch(tun_status_script, update_interval, function(widget, stdout, stderr, exitreason, exitcode)
  if exitcode == 0 then
    local count = tonumber(string.match(stdout, "%d+"))
    update_widget(count)
  else
    update_widget(-1)
  end
end)

return yay_count_widget
