return function()
    local db = require("dashboard")

    db.custom_header = {
        "",
        "██████╗  █████╗ ██████╗  █████╗ ██╗   ██╗██╗███╗   ███╗",
        "██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║   ██║██║████╗ ████║",
        "██████╔╝███████║██████╔╝███████║██║   ██║██║██╔████╔██║",
        "██╔═══╝ ██╔══██║██╔═══╝ ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║     ██║  ██║██║     ██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }

    db.custom_center = {
        {
            icon = " ",
            desc = "New file",
            shortcut = "e",
        },
        {
            icon = " ",
            desc = "Find file",
            shortcut = "f",
            action = "Telescope frecency",
        },
        {
            icon = " ",
            desc = "Quit",
            shortcut = "q",
            action = "qa",
        },
    }
    db.hide_statusline = false
end
