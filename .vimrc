" with vi
set nocompatible  

set number
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup

set hlsearch

" auto close paranthesis, brackets, braces

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" enable syntax and plugins 
syntax enable
filetype plugin on

" FINDING FILES

" search down into subfolders 
" provides tab-completion for all file-related taks
set path+=**

" Display all matching files when we tab complete
set wildmenu


