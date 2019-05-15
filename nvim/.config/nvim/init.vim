" Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins (vim-plug)
call plug#begin('~/.config/nvim/plugged')

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" git wrapper
Plug 'tpope/vim-fugitive'

" show vim diffs and work with hunks
Plug 'airblade/vim-gitgutter'

" status line
Plug 'vim-airline/vim-airline'

" Plugin list ends here.  Plugins become visible to vim after this call.
call plug#end()

" tab control (ie: use spaces)
set expandtab
set shiftwidth=2
set softtabstop=2

" appearance
set number relativenumber
set title

" don't show mode under airline
set noshowmode

" searching
set ignorecase
set smartcase

" mappings
" remove trailing whitespace
nmap <leader><space> :%s/\s\+$<cr>

" Control-S Save
nmap <C-S> :w<cr>
vmap <C-S> <esc>:w<cr>
imap <C-S> <esc>:w<cr>

