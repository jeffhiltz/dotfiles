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

" quoting/parenthesizing
Plug 'tpope/vim-surround'

" commenting
Plug 'tpope/vim-commentary'

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

" colors
set termguicolors
colorscheme vogel5000_hard
let g:airline_theme = 'gruvbox'

" treat svelte files as html
au! BufNewFile,BufRead *.svelte set ft=html

" treat vcv rack files as json
au! BufNewFile,BufRead *.vcv set ft=json

" treat ksy files as yaml
au! BufNewFile,BufRead *.ksy set ft=yaml

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
