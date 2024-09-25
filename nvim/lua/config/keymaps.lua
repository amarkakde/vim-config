local keymap = vim.keymap

local opts = {noremap = true, silent = true }
-- Directory navigation
keymap.set("n", "<leader>e", ":Neotree filesystem toggle<CR>", opts)
-- map 'o' to focus neotree
keymap.set("n", "<leader>o", ":Neotree focus<CR>", {desc = "NeoTree Focus"})

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

-- clear highlight on search
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- comments
keymap.set("n", "<C-/>", "gcc", opts)
keymap.set("v", "<C-/>", "gcc", opts)

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


