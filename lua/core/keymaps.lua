vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General Keymaps
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts) -- Open file explorer
keymap("n", "tt", ":TSPlaygroundToggle<CR>", opts) -- Toggle TreeSitter playground
keymap({"i", "n"}, "<C-s>", "<cmd>:w<cr><esc>", opts) -- Save file in insert mode

-- Move selected line / block of text in visual mode
keymap("x", "<C-Up>", ":MoveBlock(-1)<CR>", opts)
keymap("x", "<C-Down>", ":MoveBlock(1)<CR>", opts)

-- Move line in normal mode
keymap("n", "<C-Up>", ":MoveLine(-1)<CR>", opts)
keymap("n", "<C-Down>", ":MoveLine(1)<CR>", opts)

-- Move line in insert mode
keymap("i", "<C-Up>", ":MoveLine(-1)<CR>", opts)
keymap("i", "<C-Down>", ":MoveLine(1)<CR>", opts)

-- Telescope keymaps
keymap("n", "ff", ":Telescope find_files<CR>", opts) -- Find files
keymap("n", "fw", ":Telescope live_grep<CR>", opts)

-- LSP Keymaps
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) -- Go to Definitions

-- fuck you deleted bullshit
keymap("n", "dd", '"_dd', opts)

keymap("n", "xx", function()
    local line = vim.fn.getline(".")
    vim.api.nvim_del_current_line()
    vim.fn.setreg("+", line)
end, opts) -- Replace dd to yank and delete

-- Bufferline
keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts)

keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>") -- Exit search mode
