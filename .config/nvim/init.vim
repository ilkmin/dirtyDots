" Contains configuration includes

source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/vim-plug.vim

" Plugins configuration
source $HOME/.config/nvim/plugins/better-whitespace.vim
source $HOME/.config/nvim/plugins/coc.vim
source $HOME/.config/nvim/plugins/vim-which-key.vim

" Auto-source
au! BufWritePost $MYVIMRC source %
