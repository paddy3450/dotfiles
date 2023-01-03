-- Modes
-- normal_mode = "n",
-- insert_mode = "i".
-- visual_mode = "v".
-- visual_block_mode = "x".
-- term_mode = "t".
-- command_mode = "c".

--NORMAL--
-- window navigation
-- vim.keymap.set("n", "<C-h>", "<c-w>h", { desc = ' '})
-- vim.keymap.set("n", "<C-j>", "<c-w>j", { desc = ' '})
-- vim.keymap.set("n", "<C-k>", "<c-w>k", { desc = ' '})
-- vim.keymap.set("n", "<C-l>", "<c-w>l", { desc = ' '})

vim.keymap.set("n", "<leader>w", vim.cmd.write, { desc = '[W]rite buffer'})
vim.keymap.set("n", "<leader>q", vim.cmd.quit, { desc = '[Q]uit buffer'})

-- Resize with arrorws
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = 'Make window wider'})
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = 'Make window narrower'})
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = 'Make window shorter'})
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = 'Make window wider'})
vim.keymap.set("n", "<leader>o", vim.cmd.only, { desc = '[O]nly window'})

-- Netrw
vim.keymap.set("n", "<leader>E", ":Explor<CR>", { desc = '[E]xplorer netrw'})
vim.keymap.set("n", "<leader>e", ":Lexplor<CR>", { desc = '[e]xplorer netrw as side bar'})

-- keep curser central when moving
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z") -- join line, keep curser stationary

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- yank to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- yank to system clipboard
vim.keymap.set("n", "<leader>s", vim.cmd.nohl, { desc = 'Remove [S]earch highlights'})
-- vim.keymap.set("n", "<leader>sh", ":sp<CR>", { desc = ' '})
-- vim.keymap.set("n", "<leader>sv", ":splithoriz<CR>", { desc = ' '})
-- vim.keymap.set("n", "<leader>b", ":bufers<CR>", { desc = ' '})
vim.keymap.set("n", "<leader>nn", ":set number! relativenumber!<CR>", { desc = 'Toggle Relative [N]umber and [N]umber'})
vim.keymap.set("n", "<leader>nu", ":set number!<CR>", { desc = 'Toggle [NU]mber'})
vim.keymap.set("n", "<leader>nr", ":set relativenumber!<CR>", { desc = 'Toggle [N]umber [R]elative '})
vim.keymap.set("n", "<leader>tt", ":sp<CR>:term<CR>:set nonumber norelativenumber<CR>i", { desc = '[TT]erminal'})

-- VISUAL MODE
-- indenting
vim.keymap.set("v", "<", "<gv", { desc = 'Keep visual selection when indenting'})
vim.keymap.set("v", ">", ">gv", { desc = 'Keep visual selection when indenting'})

-- Move text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "p", '"_dP', {}) -- keep previous yank when pasting over selected text

-- Visual Block --
-- Move text up and down
-- vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", {})
-- vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", {})
-- vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", {})
-- vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", {})

-- TERMINAL
vim.keymap.set("t", "<C-w>h", "<C-\\><C-n><C-w>h", { desc = 'Control h to move out of a terminal window'})
vim.keymap.set("t", "<C-w>j", "<C-\\><C-n><C-w>j", { desc = 'Control j to move out of a terminal window'})
vim.keymap.set("t", "<C-w>k", "<C-\\><C-n><C-w>k", { desc = 'Control k to move out of a terminal window'})
vim.keymap.set("t", "<C-w>l", "<C-\\><C-n><C-w>l", { desc = 'Control l to move out of a terminal window'})
