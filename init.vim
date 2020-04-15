let g:dracula_colorterm = 0
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

map <C-p> :FZF<CR>
vmap '' :w !pbcopy<CR><CR>

set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set number

syntax on
colorscheme dracula 
