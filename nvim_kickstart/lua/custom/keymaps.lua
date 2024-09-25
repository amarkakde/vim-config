-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Close the current buffer
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true }) -- Close buffer
-- Switch to the next buffer
vim.keymap.set('n', '<leader>bn', ':bn<CR>', { noremap = true, silent = true }) -- Next buffer
-- Switch to the previous buffer
vim.keymap.set('n', '<leader>bp', ':bp<CR>', { noremap = true, silent = true }) -- Previous buffer
-- List all buffers (optional)
vim.keymap.set('n', '<leader>bl', ':ls<CR>', { noremap = true, silent = true }) -- List buffers

-- Pane navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true }) -- navigate to left
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true }) -- navigate to Down
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true }) -- navigate to Up
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true }) -- navigate to right

-- Window Management
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true }) -- split vertically
vim.keymap.set('n', '<leader>sh', ':split<CR>', { noremap = true, silent = true }) -- split horizontally
vim.keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>', { noremap = true, silent = true }) --Toggle Minimize

-- indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
-- comments
vim.keymap.set('n', '<C-/>', function()
  vim.api.nvim_command 'normal! gcc'
end, { noremap = true, silent = true })
vim.keymap.set('v', '<C-/>', 'gcc', { noremap = true, silent = true })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

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
