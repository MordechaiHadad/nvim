return function()
    local navic = require("nvim-navic")
    local illuminate = require("illuminate")

    require("mason-lspconfig").setup()
    require("lspconfig").sumneko_lua.setup({
        on_attach = function(client, bufnr)
            navic.attach(client, bufnr)
            illuminate.on_attach(client)
        end,
    })
    require("lspconfig").rust_analyzer.setup({
        on_attach = function(client, bufnr)
            navic.attach(client, bufnr)
            illuminate.on_attach(client)
        end,
    })
    require("lspconfig").tsserver.setup({
        on_attach = function(client, bufnr)
            navic.attach(client, bufnr)
            illuminate.on_attach(client)
        end,
    })
    require("lspconfig").pyright.setup({
        on_attach = function(client, bufnr)
            navic.attach(client, bufnr)
            illuminate.on_attach(client)
        end,
    })
end
