local autocmd = vim.api.nvim_create_autocmd

autocmd({ "FileType" }, {
    pattern = { "help", "startuptime", "qf", "lspinfo", "man" },
    callback = function()
        vim.keymap.set("n", "q", function()
            vim.cmd([[close]])
        end, {
            noremap = true,
            silent = true,
            buffer = true,
        })
        vim.keymap.set("n", "<esc>", function()
            vim.cmd([[close]])
        end, {
            noremap = true,
            silent = true,
            buffer = true,
        })
    end,
    desc = "Map q and esc to close help, man, startuptime buffers",
})

autocmd("BufEnter", {
    callback = function()
        vim.bo.ft = "vinyl"
    end,
    pattern = "*.vnl",
})
