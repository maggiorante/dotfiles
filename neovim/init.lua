-- [[ Setting options ]]

-- Set the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

if not vim.g.vscode then
	-- Set to true if you have a Nerd Font installed and selected in the terminal
	vim.g.have_nerd_font = true

	-- Make line numbers default
	vim.o.number = true

	-- Enable mouse mode, can be useful for resizing splits for example!
	vim.o.mouse = 'a'

	-- Sets how neovim will display certain whitespace characters in the editor.
	--  See `:help 'list'`
	--  and `:help 'listchars'`
	vim.o.list = true
	vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

	-- Turn on wildmenu (command line completion)
	vim.o.wildmenu = true

	-- Use spaces instead of tabs
	vim.o.expandtab = true
	vim.o.smarttab = true
	vim.o.shiftwidth = 2
	vim.o.tabstop = 2
end

-- [[ Basic Keymaps ]]

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- `Esc` removes search highlights
keymap("n", "<Esc>", "<Esc>:nohlsearch<CR>", opts)

-- Unbinds the Space key as it's used as the leader key
keymap("n", "<Space>", "", opts)

-- Improves navigation when wrapping
-- by swapping `j` with `gj` and `k` with `gk`
keymap("n", "j", "gj", opts)
keymap("n", "gj", "j", opts)
keymap("n", "k", "gk", opts)
keymap("n", "gk", "k", opts)

if vim.g.vscode then
	require "vscode-neovim.keymaps"
else
	-- Remap jk to `Esc`
	keymap("i", "jk", "<Esc>", opts)
end
