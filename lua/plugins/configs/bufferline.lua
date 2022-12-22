return function()
    require("bufferline").setup({
        options = {
            show_close_icon = false,
            close_command = function(bufname)
                require("bufdelete").bufdelete(bufname, true)
            end,
        },
    })
end
