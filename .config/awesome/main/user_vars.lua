local _VARS = {
    -- Initial
    -- This is used later as the default terminal and editor to run.
    terminal         = os.getenv("TERM") or "alacritty" or "xterm",
    editor           = os.getenv("EDITOR") or "micro" or "nano",

    -- Preference
    brave            = "flatpak run com.brave.Browser",
    browser          = os.getenv("BROWSER"),
    rofi             = "rofi -show run",
    betterlockscreen = "betterlockscreen -l -t \"It can only show time.\" "
}

return _VARS
