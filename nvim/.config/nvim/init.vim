" Plugins (vim-plug)
call plug#begin('~/.config/nvim/plugged')

" show vim diffs and work with hunks
Plug 'airblade/vim-gitgutter'

" ale is a Languge Server Protocol client (for async linting, etc.)
" Plug 'w0rp/ale'

" syntax highlighting and improved indentation 
" Plug 'pangloss/vim-javascript'

" Syntax checking
" Plug 'vim-syntastic/syntastic'

" status line
Plug 'vim-airline/vim-airline'

" Plugin list ends here.  Plugins become visible to vim after this call.
call plug#end()

" Enable syntax highlighting for JSDocs (vim-javascript)
" let g:javascript_plugin_jsdoc = 1

" Configuration for using Syntastic with eslint
" From: https://medium.com/@hpux/vim-and-eslint-16fa08cc580f
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'
