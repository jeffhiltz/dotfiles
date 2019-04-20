" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins (vim-plug)
call plug#begin('~/.config/nvim/plugged')

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
set number
set title

" mappings
" remove trailing whitespace
nmap <leader><space> :%s/\s\+$<cr>

