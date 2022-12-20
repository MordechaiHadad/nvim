--         ╭──────────────────────────────────────────────────────────╮
--         │                           Plugins                        │
--         ╰──────────────────────────────────────────────────────────╯

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
 if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
     "git",
     "clone",
     "--filter=blob:none",
     "--single-branch",
     "https://github.com/folke/lazy.nvim.git",
     lazypath,
   })
 end
 vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
    -- Colorscheme
    {dir = "/home/morde/repos/themer.lua", config = require("plugins.configs.themer")},
    {"nvim-treesitter/nvim-treesitter", config = require("plugins.configs.treesitter"), build = ":TSUpdate"},
})
