" {{{ Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
call plug#end()
" }}}

" {{{ Settings
set clipboard=unnamedplus
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set noshowmode
" }}}

" {{{ Keys
let mapleader = ","

nnoremap                   +  <C-a>
nnoremap                   -  <C-x>


nnoremap <silent> <leader>a   :<C-u>call VSCodeNotify('workbench.action.toggleActivityBarVisibility')<cr>
xnoremap <silent> <leader>a   :<C-u>call VSCodeNotify('workbench.action.toggleActivityBarVisibility')<cr>
nnoremap <silent> <leader>e   :<C-u>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>
xnoremap <silent> <leader>e   :<C-u>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>
nnoremap <silent> <leader>t   :<C-u>call VSCodeNotify('workbench.action.togglePanel')<cr>
xnoremap <silent> <leader>t   :<C-u>call VSCodeNotify('workbench.action.togglePanel')<cr>
nnoremap <silent> <leader>ff  :<C-u>call VSCodeNotify('workbench.action.quickOpen')<cr>
xnoremap <silent> <leader>ff  :<C-u>call VSCodeNotify('workbench.action.quickOpen')<cr>
nnoremap <silent> <leader>re  :<C-u>call VSCodeNotify('editor.action.rename')<cr>
xnoremap <silent> <leader>re  :<C-u>call VSCodeNotify('editor.action.rename')<cr>
nnoremap <silent> <leader>yd  :<C-u>let @+ = expand("%:p:h")<cr>
nnoremap <silent> <leader>yf  :<C-u>let @+ = expand("%:p") <cr>
"}}}
