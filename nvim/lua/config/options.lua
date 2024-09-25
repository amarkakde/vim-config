local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- search 
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

--appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = '100'
opt.signcolumn = 'yes'
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

-- behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
vim.schedule( function()
    opt.clipboard = "unnamedplus"
end)
opt.modifiable = true
opt.encoding = "utf-8"
opt.inccommand = 'split'
opt.updatetime = 250
