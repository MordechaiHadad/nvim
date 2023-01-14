return function()
    local navic = require("nvim-navic")
    local illuminate = require("illuminate")
    local mason = require("mason-lspconfig")

    mason.setup()

    mason.setup_handlers({
        function(server_name)
            require("lspconfig")[server_name].setup({
                on_attach = function(client, bufnr)
                    navic.attach(client, bufnr)
                    illuminate.on_attach(client)
                end,
            })
        end,
    })
end
