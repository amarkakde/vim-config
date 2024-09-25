local keymap = vim.keymap

local opts = {noremap = true, silent = true }
-- Directory navigation
keymap.set("n", "<leader>e", ":Neotree filesystem toggle<CR>", opts)

-- Pane navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- navigate to left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- navigate to Down 
keymap.set("n", "<C-k>", "<C-w>k", opts) -- navigate to Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- navigate to right

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- split vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- split horizontally 
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) --Toggle Minimize

-- indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- comments
keymap.set("n", "<C-/>", "gcc", opts)
keymap.set("v", "<C-/>", "gcc", opts)
