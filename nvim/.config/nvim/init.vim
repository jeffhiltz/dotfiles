" Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins (vim-plug)
call plug#begin('~/.config/nvim/plugged')

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" gruvbox colors
Plug 'morhetz/gruvbox'

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" git wrapper
Plug 'tpope/vim-fugitive'

" status line
Plug 'vim-airline/vim-airline'

" tool for building vim colour schemes
Plug 'lifepillar/vim-colortemplate'

" Plugin list ends here.  Plugins become visible to vim after this call.
call plug#end()

" tab control (ie: use spaces)
set expandtab
set shiftwidth=2
set softtabstop=2

let g:vim_markdown_new_list_item_indent=0

" appearance
" set number relativenumber
set title

" don't show mode under airline
set noshowmode

" searching
set ignorecase
set smartcase

" mappings
" remove trailing whitespace
nmap <leader><space> :%s/\s\+$<cr>:noh<cr>
" turn off highlighting
nmap <leader>h :noh<cr>

" Control-S Save
nmap <C-S> :w<cr>
vmap <C-S> <esc>:w<cr>
imap <C-S> <esc>:w<cr>

" colors
set termguicolors
colorscheme vogel5000_hard
let g:airline_theme = 'gruvbox'

" treat svelte files as html
au! BufNewFile,BufRead *.svelte set ft=html

" treat vcv rack files as json
au! BufNewFile,BufRead *.vcv set ft=json
