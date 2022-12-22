return function()
    local null_ls = require("null-ls")
    require("crates").setup({
        null_ls = {
            enabled = true,
            name = "crates.nvim",
        },
    })
end
