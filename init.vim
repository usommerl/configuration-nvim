" {{{ Functions
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

function! MyFoldText()
  let linetext = substitute(getline(v:foldstart),"^ *","",1)
  let text_without_fold_markers = substitute(linetext, '.*{\{3}\s*', '', 'g')
  return '-- ' . text_without_fold_markers . ' '
endfunction

function! DiffToggle()
  if &diff
    diffoff
  else
    diffthis
  endif
endfunction
" }}}

" {{{ Plugins
call plug#begin('~/.config/nvim/plugged')
" {{{ Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
" }}}
Plug 'airblade/vim-gitgutter'
Plug 'cohama/lexima.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite-session'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Konfekt/FastFold'
Plug 'kopischke/vim-stay'
Plug 'Yggdroot/indentLine'
call plug#end()
" {{{ Plugin Settings
" {{{ IndentLine
let g:indentLine_char = '┊'
let g:indentLine_noConcealCursor=1
let g:indentLine_fileTypeExclude = ['text', 'help']
" }}}
" {{{ Peekaboo
let g:peekaboo_window = 'vertical botright 70new'
" }}}
" {{{ Undotree
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
" }}}
" {{{ Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
" }}}
" {{{ FastFold
let g:is_bash = 1
let g:sh_fold_enabled = 7
let g:ruby_fold = 1
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
" }}}
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
" {{{ Lightline
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [['mode', 'absolutepath', 'modified'], ['fugitive']],
      \   'right': [[], ['percent', 'lineinfo'], ['fileformat', 'fileencoding', 'filetype']]
      \ },
      \ 'inactive': {
      \   'left': [['absolutepath', 'modified']],
      \   'right': [[], ['percent', 'lineinfo'], []]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive'
      \ }
      \ }

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction
" }}}
" }}}
" }}}

" {{{ Settings
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
set foldtext=MyFoldText()
set foldlevelstart=99
set nofoldenable
set listchars=tab:▸\ ,trail:█,nbsp:%
set list
set noshowmode
set undofile
colorscheme seoul256
" }}}

" {{{ Keys
let mapleader = ","
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nnoremap                  +        <C-a>
nnoremap                  -        <C-x>
nnoremap <silent> <C-l>            :<C-u>nohlsearch<cr><C-l>
nnoremap          <C-e>            6<C-e>
nnoremap          <C-y>            6<C-y>
nnoremap          <leader>.        :b#<cr>
nnoremap <silent> <leader>bb       :<C-u>Buffers<cr>
nnoremap <silent> <leader>bd       :<C-u>b#\|bd #<cr>
nnoremap <silent> <leader>bc       :<C-u>%bdelete<cr>
nnoremap <silent> <Leader>dw       :windo call DiffToggle()<CR>
nnoremap <silent> <Leader>dgl      :diffget LOCAL \| diffupdate<CR>
nnoremap <silent> <Leader>dgr      :diffget REMOTE \| diffupdate<CR>
nnoremap <silent> <Leader>dgb      :diffget BASE \| diffupdate<CR>
nnoremap <silent> <leader>ff       :<C-u>Files<cr>
nnoremap <silent> <leader>fe       :<C-u>FZF -e -m<cr>
nnoremap          <leader>Gd       :<C-u>Gdiff<cr>
nnoremap          <leader>Gst      :<C-u>Gstatus<cr>
nnoremap          <leader>Gc       :<C-u>Gcommit -v<cr>
nnoremap          <leader>Gb       :<C-u>Gblame<cr>
nnoremap          <leader>Ghr      :<C-u>GitGutterUndoHunk<cr>
nnoremap          <leader>Gha      :<C-u>GitGutterStageHunk<cr>
nnoremap          <leader>Ghp      :<C-u>GitGutterPreviewHunk<cr>
nnoremap          <leader>Gl       :<C-u>GV<cr>
nnoremap          <leader>GL       :<C-u>GV!<cr>
nnoremap          <leader>Gw       :<C-u>Gwrite<cr>
nnoremap <silent> <leader>gg       :<C-u>Unite -buffer-name=grep -no-empty grep<cr>
nnoremap          <leader>go       :<C-u>Unite -buffer-name=grep -no-empty grep:.:
nnoremap <silent> <leader>gr       :<C-u>UniteResume grep<cr>
nnoremap <silent> <leader>gb       :<C-u>Unite -buffer-name=grep -no-empty grep:$buffers<cr>
nnoremap          <leader>l        :setlocal list!<cr>
nnoremap <silent> <leader>o        :<C-u>Unite -buffer-name=outline -vertical outline<cr>
nnoremap <silent> <leader>rr       :<C-u>Unite -buffer-name=register register<cr>
nnoremap          <leader>r<space> :<C-u>%s/\s\+$/<cr>
vnoremap          <leader>r<space> :s/\s\+$/<cr>
nnoremap <silent> <leader>ss       :<C-u>Unite -buffer-name=sessions -start-insert session<cr>
nnoremap <silent> <leader>sw       :<C-u>UniteSessionSave<cr>:<C-u>echo "Session saved"<cr>
nnoremap <silent> <leader>sn       :<C-u>Unite -buffer-name=sessions -start-insert session/new<cr>
nnoremap <silent> <leader>sc       :<C-u>UniteSessionLoad default<cr>:bufdo bd!<cr>
nnoremap <silent> <leader>st       :<C-u>echo v:this_session<cr>
nnoremap          <leader>tn       :<C-u>tabnew<cr>
nnoremap          <leader>td       :<C-u>tabclose<cr>
nnoremap          <leader>u        :<C-u>:UndotreeToggle<cr>
nnoremap <silent> <leader>w        :<C-u>set wrap!<cr>
nnoremap <silent> <leader>yy       :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> <leader>yd       :<C-u>let @+ = expand("%:p:h")<cr>
nnoremap <silent> <leader>yf       :<C-u>let @+ = expand("%:p") <cr>
"}}}

" {{{ Commands
command! Sw w !sudo tee % > /dev/null
" }}}

" {{{ Autocommands
au! BufWritePost $MYVIMRC nested source $MYVIMRC | setlocal foldmethod=marker
au! BufEnter $MYVIMRC setlocal foldmethod=marker
au! Filetype scala,java,ruby,sh,vim let &l:colorcolumn=81
au Filetype ruby setlocal re=1
au! VimResized * :wincmd =
" }}}
