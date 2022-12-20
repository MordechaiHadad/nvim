return function()
    require("nvim-treesitter.install").compilers = { "clang" }

    local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

    parser_configs.norg = {
        install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg",
            files = { "src/parser.c", "src/scanner.cc" },
            branch = "main",
        },
    }

    parser_configs.vinyl = {
        install_info = {
            url = "~/repos/vinyl-lang/vendor/tree-sitter-vinyl",
            files = { "src/parser.c" },
        },
        filetype = "vnl",
    }

    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "bash",
            "c",
            "c_sharp",
            "cpp",
            "comment",
            "css",
            "dockerfile",
            "gdscript",
            "html",
            "hjson",
            "javascript",
            "json",
            "json5",
            "lua",
            "query",
            "regex",
            "rust",
            "scss",
            "svelte",
            "toml",
            "tsx",
            "typescript",
            "yaml",
            "norg",
            "python",
            "dart",
            "llvm",
        },
        highlight = {
            enable = true, -- false will disable the whole extension
        },
        playground = {
            enable = true,
        },
        autotag = { enable = true },
    })

    -- Folds
    vim.opt.foldmethod = "indent"
end
