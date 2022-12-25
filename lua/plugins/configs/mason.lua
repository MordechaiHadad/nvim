return function()
    require("mason-lspconfig").setup()
    require("lspconfig").sumneko_lua.setup({})
    require("lspconfig").rust_analyzer.setup({})
end
