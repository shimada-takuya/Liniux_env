syntax on

"color scheme
autocmd ColorScheme * highlight Normal ctermbg=none    
autocmd ColorScheme * highlight LineNr ctermbg=none    
autocmd ColorScheme * highlight Identifier ctermbg=none
autocmd ColorScheme * highlight Special ctermbg=none   
autocmd ColorScheme * highlight VertSplit ctermbg=none
colorscheme iceberg
"set background=dark

if &compatible
	set nocompatible
endif

" statusline
function! SetStatusLine()
        if mode() =~ 'i'
                let c = 1
                let mode_name = 'Insert'
        elseif mode() =~ 'n'
                let c = 2
                let mode_name = 'Normal'
        elseif mode() =~ 'R'
                let c = 3
                let mode_name = 'Replace'
        else
                let c = 4
                let mode_name = 'Visual'
        endif
        return '%' . c . '*[ ' . mode_name . ' ]%* %<%F%=%m%r %18([%{toupper(&ft)}][%l/%L]%)'
endfunction

hi User1 cterm=bold ctermbg=red ctermfg=black
hi User2 cterm=bold ctermbg=blue ctermfg=black
hi User3 cterm=bold ctermbg=gray ctermfg=black
hi User4 cterm=bold ctermbg=green ctermfg=black
"hi User1 gui=bold guibg=red guifg=black
"hi User2 gui=bold guibg=blue guifg=black
"hi User3 gui=bold guibg=coral guifg=black
"hi User4 gui=bold guibg=green guifg=black

set statusline=%!SetStatusLine()
set laststatus=2

"indent
set autoindent
set tabstop=2
set shiftwidth=2
"set expandtab
set smartindent

"cursor
"set cursorcolumn
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"cmd
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <silent> jj <Esc>
noremap <tab> ==

"Plagin

"" netrw
filetype plugin on
let g:netrw_liststyle=3
let g:netrw_preview=1

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch

" encoding
set encoding=utf-8
set fileencodings=utf-8
" set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

"" file
set nobackup
set noundofile

set backspace=indent,eol,start

"" scroll
set scrolloff=5

"" Plugin
"packadd vim-jetpack
"call jetpack#begin()
"Jetpack 'tani/vim-jetpack', {'opt': 1} "bootstrap
"Jetpack 'junegunn/fzf', { 'do': {-> fzf#install()} }
"Jetpack 'junegunn/fzf.vim'
"Jetpack 'gkeep/iceberg-dark'
"Jetpack 'vim-airline/vim-airline'
"Jetpack 'vim-airline/vim-airline-themes'
"call jetpack#end()

"let g:airline#extensions#tabline#enabled = 1
"let g:airline_section_c = '%F'
"let g:airline_theme = 'icebergDark'

"" flake8
"let g:syntastic_python_checkers = ["flake8"]
"let g:syntastic_python_flake8_args = "--max-line-length=120 --max-complexity=10"
