-- shorten function name 
local keymap = vim.keymap.set
-- silent keymap option
local opts = { silent = ture }

-- Modes
-- normal_mode = "n",
-- insert_mode = "i".
-- visual_mode = "v".
-- visual_block_mode = "x".
-- term_mode = "t".
-- command_mode = "c".

--NORMAL--
-- window navigation
keymap("n", "<C-h>", "<c-w>h", opts)
keymap("n", "<C-j>", "<c-w>j", opts)
keymap("n", "<C-k>", "<c-w>k", opts)
keymap("n", "<C-l>", "<c-w>l", opts)

keymap("n", "<leader>o", ":only<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)

-- Resize with arrorws
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Netrw
keymap("n", "<leader>e", ":Explor<CR>", opts)
keymap("n", "<leader>E", ":Lexplor<CR>", opts)

keymap("n", "<leader>s", ":nohl<CR>", opts)
keymap("n", "<leader>sh", ":sp<CR>", opts)
keymap("n", "<leader>sv", ":splithoriz<CR>", opts)
keymap("n", "<leader>b", ":bufers<CR>", opts)
keymap("n", "<leader>nn", ":set number! relativenumber!<CR>", opts)
keymap("n", "<leader>nu", ":set number!<CR>", opts)
keymap("n", "<leader>nr", ":set relativenumber!<CR>", opts)
keymap("n", "<leader>tt", ":sp<CR>:term<CR>:set nonumber norelativenumber<CR>i", opts)

keymap("n", "<leader>go", ":Goyo<CR>", opts)

-- Telescope
local builtin = require("telescope.builtin")
keymap("n", "<leader>ff", builtin.find_files, {})
keymap("n", "<leader>fg", builtin.live_grep, {})
keymap("n", "<leader>fh", builtin.help_tags, {})
keymap("n", "<leader>fh", builtin.help_tags, {})

-- VISUAL MODE
-- indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- TERMINAL
keymap("t", "<C-w>h", "<C-\\><C-n><C-w>h", opts)
keymap("t", "<C-w>j", "<C-\\><C-n><C-w>j", opts)
keymap("t", "<C-w>k", "<C-\\><C-n><C-w>k", opts)
keymap("t", "<C-w>l", "<C-\\><C-n><C-w>l", opts)
