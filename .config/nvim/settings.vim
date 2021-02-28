" General config

" Set leader key
"let g:mapleader = "\<Space>"

" Syntax highlighting
syntax enable

" Hide buffers
set hidden

" Indentations
set autoindent   " apply on next line
set smartindent  " reacts to syntax of the code

" Searching options
set hlsearch    " search highlighting
set incsearch   " highlight as soon as match
set ignorecase  " case insensitivity
set smartcase   " case sensitive if contains Uppercase letters

" Display numbering (hybrid)
set number relativenumber

" History
set history=1000

" Display windows titles
set title
set titlestring=%t  " filename as a title

" TABs
set tabstop=4      " the width of a TAB ('\t')
set softtabstop=4  " number of columns for a TAB
set showtabline=2  " always show TABs inserted

" TABs to spaces
set shiftwidth=4  " indents width
set expandtab     " expand TABs to spaces
set smarttab      " inserts blanks

" File encoding (UTF-8)
set encoding=utf-8      " shown in a terminal
set fileencoding=utf-8  " written to a file

" Terminal dysplay
set t_Co=256         " support 256 colours
set cursorline       " highlight the current line
set cmdheight=2      " extra line for dysplaying messages
set background=dark  " try to use good-looking colours
set mouse=a          " enables mouse support

" Disable continuation of comments on newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Cross-clipboard
set clipboard^=unnamed,unnamedplus

" Screen update frequency
set updatetime=300  " faster completion by 'coc'
set timeoutlen=300  " timeout when key is held

