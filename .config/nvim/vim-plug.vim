" ####################
" ##### Vim-Plug #####
" ####################

" ### Bootstrap installation ###
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path

" ### Calling plugins ###
let pluginsPath = stdpath('data') . '/plugged'
call plug#begin(pluginsPath)

" Show trailing whitespaces (and delete them)
Plug 'ntpeters/vim-better-whitespace'

" Great LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Keybindings helper
Plug 'liuchengxu/vim-which-key'

call plug#end()
unlet pluginsPath
