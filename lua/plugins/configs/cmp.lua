return function()
	local present, cmp = pcall(require, "cmp")

	if not present then
		return
	end

	local icons = {
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "",
		Event = "",
		Operator = "",
		TypeParameter = "",
	}
	cmp.setup({
		completion = {
			completeopt = "menuone,noselect",
		},
		formatting = {
			fields = {
				cmp.ItemField.Kind,
				cmp.ItemField.Abbr,
				cmp.ItemField.Menu,
			},
			format = function(entry, vim_item)
				vim_item.kind = icons[vim_item.kind]
				vim_item.menu = ({
					nvim_lsp = "(LSP)",
					path = "(Path)",
					luasnip = "(Snippet)",
					buffer = "(Buffer)",
					neorg = "(Neorg)",
					calc = "(Calculator)",
					cmp_tabnine = "(Tabnine)",
					cmp_nuget = "(NuGet)",
				})[entry.source.name]
				vim_item.dup = ({
					buffer = 1,
					path = 1,
					nvim_lsp = 0,
				})[entry.source.name] or 0
				return vim_item
			end,
		},
		mapping = {
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.close(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					})
				elseif require("luasnip").expand_or_jumpable() then
					vim.fn.feedkeys(
						vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
						""
					)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<Down>"] = cmp.mapping.select_next_item(),
			["<Up>"] = cmp.mapping.select_prev_item(),
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = {
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
			{ name = "cmp_tabnine" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "neorg" },
			{ name = "calc" },
			{ name = "cmp-nuget" },
			{ name = "crates" },
		},
		experimental = {
			ghost_text = true,
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "cmdline" },
		},
	})

	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})
end
