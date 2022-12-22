return function()
	local telescope = require("telescope")

	local actions = require("telescope.actions")

	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<esc>"] = actions.close,
				},
			},
			prompt_prefix = "   ",
		},
	})
	telescope.load_extension("projects")
	telescope.load_extension("frecency")
	telescope.load_extension("themes")
	telescope.load_extension("neoclip")

	if vim.bo.filetype == "norg" then
		require("neorg").modules.load_module("core.integrations.telescope")
	end
end
