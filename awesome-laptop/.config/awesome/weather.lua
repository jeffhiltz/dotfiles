-- use wttr.in to get the current weather

local awful = require("awful")
local wibox = require("wibox")

local update_interval = 900 -- in seconds

local weather_widget = wibox.widget.textbox()

-- sample response from wttr.in:
-- +9°C
local current_conditions_script = [[
  bash -c "
  curl wttr.in/?format=\"%t\"
  "]]

local function update_widget(current_conditions)
	weather_widget:set_text(current_conditions)
end

awful.widget.watch(current_conditions_script, update_interval, function(widget, stdout)
  local current_conditions = stdout
  update_widget(current_conditions)
end)

return weather_widget
