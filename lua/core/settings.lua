-- General settings
vim.o.wrap = false -- no wraping

local current_buffer = vim.api.nvim_get_current_buf()
local is_modifiable = vim.api.nvim_buf_get_option(current_buffer, "modifiable")
if is_modifiable then
    vim.o.fileencoding = "utf-8"
    vim.opt.fileformat = "unix"
end

vim.o.number = true -- enable numbers
vim.o.clipboard = "unnamedplus" -- enable clipboard
vim.o.backup = false
vim.o.writebackup = false
vim.o.hidden = true
vim.cmd("set timeoutlen=600")
vim.cmd("syntax on")
vim.cmd("set splitkeep=screen")

-- Indentation
vim.o.expandtab = true -- convert tabs to spaces
vim.o.autoindent = true -- tabs be smart?
vim.cmd("set smarttab")
vim.cmd("set ts=4") -- insert 4 spaces for tabs
vim.cmd("set sw=4")
vim.cmd("set undofile")

-- UI
vim.o.updatetime = 300
vim.o.showmode = false
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.pumheight = 8
vim.o.showtabline = 2

-- Completion
vim.cmd("set shortmess+=c")

if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.g.sqlite_clib_path = "C:/Program Files/Sqlite/sqlite3.dll"
    vim.o.shell = "powershell"
end

-- Folds
vim.opt.foldlevel = 100

vim.opt.laststatus = 3 -- Statusline
