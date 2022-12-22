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
set tabstop=4
set shiftwidth=4
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
""" dein
"" Ward off unexpected things that your distro might have made, as
"" well as sanely reset options when re-sourcing .vimrc
"set nocompatible
"
"" Set dein base path (required)
"let s:dein_base = '~/.cache/dein/'
"
"" Set dein source path (required)
"let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'
"
"" Set dein runtime path (required)
"execute 'set runtimepath+=' . s:dein_src
"
"" Call dein initialization (required)
"call dein#begin(s:dein_base)
"
"call dein#add(s:dein_src)
"
"" Your plugins go here:
"call dein#add('junegunn/fzf', { 'build': './install' })
"call dein#add('junegunn/fzf.vim', { 'depends': 'junegunn/fzf' })
"call dein#add('gkeep/iceberg-dark')
"call dein#add('vim-airline/vim-airline')
"call dein#add('vim-airline/vim-airline-themes')
"call dein#add('vim-syntastic/syntastic')


" Finish dein initialization (required)
"call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
"if has('filetype')
"	filetype indent plugin on
"endif

" Enable syntax highlighting
"if has('syntax')
"	syntax on
"endif

" Uncomment if you want to install not-installed plugins on startup.
"if dein#check_install()
"    call dein#install()
"endif

""" vim-jetpack
"packadd vim-jetpack
"call jetpack#begin()
"Jetpack 'tani/vim-jetpack', {'opt': 1} "bootstrap
"Jetpack 'junegunn/fzf', { 'do': {-> fzf#install()} }
"Jetpack 'junegunn/fzf.vim'
"Jetpack 'gkeep/iceberg-dark'
"Jetpack 'vim-airline/vim-airline'
"Jetpack 'vim-airline/vim-airline-themes'
"Jetpack 'vim-syntastic/syntastic'
"call jetpack#end()

"let g:airline#extensions#tabline#enabled = 1
"let g:airline_section_c = '%F'
"let g:airline_theme = 'icebergDark'

"" flake8
"let g:syntastic_python_checkers = ["flake8"]
"let g:syntastic_python_flake8_args = "--max-line-length=120 --max-complexity=10"
