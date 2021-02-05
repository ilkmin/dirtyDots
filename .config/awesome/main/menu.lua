-- Standard awesome library
local awful = require("awful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Theme handling library
local beautiful = require("beautiful")

local user_vars = require("main.user_vars")

local terminal    = user_vars.terminal
local editor      = user_vars.editor
local editor_cmd  = terminal .. " -e " .. editor

local _MENU = {}  -- module
local help  = {}  -- first submenu

help.menu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

function _MENU.get()
    -- Main menu
    local menu_items = {
        { "awesome", help.menu, beautiful.awesome_icon },
        { "open terminal", terminal }                                 
    }

    return menu_items
end

return setmetatable(
    {},
    { __call = function (_, ...) return _MENU.get(...) end }
)
