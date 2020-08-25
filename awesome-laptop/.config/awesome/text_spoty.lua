-------------------------------------------------
-- Spotify Widget for Awesome Window Manager
-- Shows currently playing song on Spotify for Linux client
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/spotify-widget

-- @author Pavel Makhov
-- @copyright 2018 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local watch = require("awful.widget.watch")

local GET_SPOTIFY_STATUS_CMD = 'sp status'
local GET_CURRENT_SONG_CMD = 'sp current-oneline'

local spotify_widget = {}

local function worker(args)

    local args = args or {}

    local play_icon = " \u{f04b} "
    local pause_icon = " \u{f04c} "
    local font = args.font or 'Play 9'

    spotify_widget = wibox.widget {
        {
            id = "icon",
            widget = wibox.widget.textbox,
            font = "MesloLGMDZ Nerd Font Bold 10",
        },
        {
            id = 'current_song',
            widget = wibox.widget.textbox,
            font = font
        },
        layout = wibox.layout.align.horizontal,
        set_status = function(self, is_playing)
            self.icon.markup = (is_playing and pause_icon or play_icon)
        end,
        set_text = function(self, path)
            self.current_song.markup = path
        end,
    }

    local update_widget_icon = function(widget, stdout, _, _, _)
        stdout = string.gsub(stdout, "\n", "")
        widget:set_status(stdout == 'Playing' and true or false)
    end

    local update_widget_text = function(widget, stdout, _, _, _)
        local escaped = string.gsub(stdout, "&", '&amp;')
        if string.find(stdout, 'Error: Spotify is not running.') ~= nil then
            widget:set_text('')
            widget:set_visible(false)
        else
            widget:set_text(escaped)
            widget:set_visible(true)
        end
    end

    watch(GET_SPOTIFY_STATUS_CMD, 1, update_widget_icon, spotify_widget)
    watch(GET_CURRENT_SONG_CMD, 1, update_widget_text, spotify_widget)

    --- Adds mouse controls to the widget:
    --  - left click - play/pause
    --  - scroll up - play next song
    --  - scroll down - play previous song
    spotify_widget:connect_signal("button::press", function(_, _, _, button)
        if (button == 1) then
            awful.spawn("sp play", false)      -- left click
        elseif (button == 4) then
            awful.spawn("sp next", false)  -- scroll up
        elseif (button == 5) then
            awful.spawn("sp prev", false)  -- scroll down
        end
        awful.spawn.easy_async(GET_SPOTIFY_STATUS_CMD, function(stdout, stderr, exitreason, exitcode)
            update_widget_icon(spotify_widget, stdout, stderr, exitreason, exitcode)
        end)
    end)

    return spotify_widget

end

return setmetatable(spotify_widget, { __call = function(_, ...)
    return worker(...)
end })

