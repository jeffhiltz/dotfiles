-- Print out Xresources colors

local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

local color_test = wibox.widget.textbox("lock icon")

local colors = {
  beautiful.xcolor0,
  beautiful.xcolor1,
  beautiful.xcolor2,
  beautiful.xcolor3,
  beautiful.xcolor4,
  beautiful.xcolor5,
  beautiful.xcolor6,
  beautiful.xcolor7,
  beautiful.xcolor8,
  beautiful.xcolor9,
  beautiful.xcolor10,
  beautiful.xcolor11,
  beautiful.xcolor12,
  beautiful.xcolor13,
  beautiful.xcolor14,
  beautiful.xcolor15,
}

local markup = ""
for i = 1,16 do
  markup = markup .. "<span background='" .. beautiful.xbackground .. "' foreground='" .. colors[i] .. "'>" .. i-1 .. "</span> "
end
color_test.markup = markup

return color_test
