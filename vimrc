syntax on

"color scheme
colorscheme iceberg
"set background=dark

"indent
set autoindent
set tabstop=2
set shiftwidth=2
"set expandtab
set smartindent

"cursor
"set cursorcolumn
"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"

"cmd
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <silent> jj <Esc>
noremap <tab> ==

"Plagin
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugin '[Github Author]/[Github repo]' 
Plugin 'preservim/nerdtree'

call vundle#end()
filetype plugin indent on

" NERDtree setup
"autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'


" Search
set incsearch
set ignorecase
set smartcase
set hlsearch






