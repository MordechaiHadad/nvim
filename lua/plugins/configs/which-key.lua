return function()
	require("which-key").setup({
		window = {
			border = "none",
		},
	})

	local wk = require("which-key")

	wk.register({
		c = {
			name = "Code",
			r = { "<cmd>Lspsaga rename<cr>", "Rename" },
			a = { "<cmd>Lspsaga code_action<cr>", "Code Actions" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Search Symbols" },
			h = { "<cmd>Lspsaga hover_doc<cr>", "Display Symbol Docs" },
		},
		f = {
			name = "File",
			f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format File" },
		},
		g = { "<cmd>Godbolt<cr>", "Godbolt Explore Current Document" },
		y = { "<cmd>Telescope neoclip<cr>", "Yank History" },
	}, {
		prefix = "<leader>",
	})
end
