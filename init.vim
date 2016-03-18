" {{{ Plugins
call plug#begin('~/.config/nvim/plugged')
" {{{ Colorschemes
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
" }}}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite-session'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()
" }}}

" {{{ Plugin Settings
" {{{ Unite
let g:unite_source_history_yank_enable = 1
let g:unite_split_rule = "botright"
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_session_enable_auto_save = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('buffer', 'sorters', 'sorter_word')
call unite#custom#source('session', 'sorters', 'sorter_word')
call unite#custom#source('grep', 'max_candidates', 0)
" }}}
" }}}

" {{{ Functions
function! GitStatus()
  let l:git_status=substitute(fugitive#statusline(), "Git(", "", "")
  let l:git_status=substitute(l:git_status, ")", "", "")
  return l:git_status
endfunction
" }}}

" {{{ General Settings
set number
set relativenumber
set cursorline
set lazyredraw
set hidden
set clipboard=unnamedplus
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set foldmethod=syntax
set foldlevelstart=99
set listchars=tab:▸\ ,trail:█,nbsp:%
colorscheme seoul256
" {{{ Statusline
set statusline=[%n]\                             " buffer number
set statusline+=%<                               " truncate from here if line is too long
set statusline+=%F                               " filename
set statusline+=\ %{GitStatus()}                 " git status
set statusline+=%m%r%h%w\                        " flags
set statusline+=%=                               " shove everything from here to the right
set statusline+=[%{strlen(&fenc)?&fenc:&enc}]\   " encoding
set statusline+=%{strlen(&ft)?'['.&ft.']\ ':''}  " filetype
set statusline+=[%l,%v]\                         " position in file [line,column]
set statusline+=[%p%%]                           " percentage
set list
" }}}
" }}}


" {{{ Keys
let mapleader = ","
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nnoremap <silent> <C-l>            :<C-u>nohlsearch<cr><C-l>
nnoremap          <C-e>            4<C-e>
nnoremap          <C-y>            4<C-y>
nnoremap          <leader>.        :b#<cr>
nnoremap          <leader>l        :set list!<cr>
nnoremap          <leader>r<space> :%s/\s\+$/<cr>
vnoremap          <leader>r<space> :s/\s\+$/<cr>
nnoremap <silent> <leader>o        :<C-u>Unite -buffer-name=outline -vertical outline<cr>
nnoremap <silent> <leader>bb       :<C-u>Unite -buffer-name=buffers buffer<cr>
nnoremap <silent> <leader>bd       :<C-u>bp\|bd #<cr>
nnoremap <silent> <leader>ff       :<C-u>Files<cr>
nnoremap <silent> <leader>fb       :<C-u>Buffers<cr>
nnoremap <silent> <leader>fe       :<C-u>FZF -e -m<cr>
nnoremap          <leader>Gd       :<C-u>Gdiff<cr>
nnoremap          <leader>Gst      :<C-u>Gstatus<cr>
nnoremap          <leader>Gc       :<C-u>Gcommit -v<cr>
nnoremap          <leader>Gb       :<C-u>Gblame<cr>
nnoremap          <leader>Ghr      :<C-u>GitGutterRevertHunk<cr>
nnoremap          <leader>Gha      :<C-u>GitGutterStageHunk<cr>
nnoremap          <leader>Ghp      :<C-u>GitGutterPreviewHunk<cr>
nnoremap          <leader>Gvb      :<C-u>Gitv<cr>
nnoremap          <leader>Gvf      :<C-u>Gitv!<cr>
nnoremap <silent> <leader>gg       :<C-u>Unite -buffer-name=grep -no-empty grep<cr>
nnoremap          <leader>go       :<C-u>Unite -buffer-name=grep -no-empty grep:.:
nnoremap <silent> <leader>gr       :<C-u>UniteResume grep<cr>
nnoremap <silent> <leader>gb       :<C-u>Unite -buffer-name=grep -no-empty grep:$buffers<cr>
nnoremap <silent> <leader>rr       :<C-u>Unite -buffer-name=register register<cr>
nnoremap <silent> <leader>ss       :<C-u>Unite -buffer-name=sessions -start-insert session<cr>
nnoremap <silent> <leader>sw       :<C-u>UniteSessionSave<cr>:<C-u>echo "Session saved"<cr>
nnoremap <silent> <leader>sn       :<C-u>Unite -buffer-name=sessions -start-insert session/new<cr>
nnoremap <silent> <leader>sc       :<C-u>echo v:this_session<cr>
nnoremap <silent> <leader>yy       :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> <leader>yd       :<C-u>let @+ = expand("%:p:h")<cr>
nnoremap <silent> <leader>yf       :<C-u>let @+ = expand("%:p") <cr>
"}}}

" {{{ Autocommands
au! BufWritePost init.vim source ~/.config/nvim/init.vim | setlocal foldmethod=marker
au! Filetype scala,java,ruby,sh,vim let &l:colorcolumn=81
au! BufWinLeave *.* setlocal backupcopy=auto|mkview
au! BufWinEnter *.* silent! loadview
" }}}
