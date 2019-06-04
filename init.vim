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

function! ToggleExpensiveUIFeatures()
  setlocal cursorline!
  setlocal relativenumber!
  IndentLinesToggle
endfunction
" }}}

" {{{ Plugins
call plug#begin('~/.config/nvim/plugged')
" {{{ Colorschemes
Plug 'jacoborus/tender'
Plug 'junegunn/seoul256.vim'
Plug 'noah/vim256-color'
Plug 'NLKNguyen/papercolor-theme'
Plug 'cocopon/iceberg.vim'
" }}}
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'brooth/far.vim'
Plug 'cohama/lexima.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() } }
Plug 'sbdchd/neoformat', { 'do': 'yarn global add js-beautify prettier typescript-formatter' }
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite-session'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'Konfekt/FastFold'
Plug 'kopischke/vim-stay'
Plug 'kopischke/vim-fetch'
Plug 'vim-scripts/bats.vim'
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
let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden -f'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_session_enable_auto_save = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('buffer', 'sorters', 'sorter_word')
call unite#custom#source('session', 'sorters', 'sorter_word')
call unite#custom#source('grep', 'max_candidates', 0)
" }}}
" {{{ EditorConfig
let g:EditorConfig_max_line_indicator = "line"
" }}}
" {{{ Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
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
" {{{ Far
let g:far#source = 'rgnvim'
let g:far#preview_window_height = 20
let g:far#window_layout = 'tab'
au! FileType far
             \ setlocal nolist |
             \ nnoremap <buffer> <silent> q :bd<cr>
" }}}
" {{{ Neoformat
let g:neoformat_enabled_typescript = ['prettier', 'tsfmt']
let g:neoformat_enabled_scss = ['prettier']
" }}}
" }}}
" {{{ coc.vim

set updatetime=300                              " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c                                " don't give |ins-completion-menu| messages.
set signcolumn=yes                              " always show signcolumns
set nobackup                                    " Some server have issues with backup files, see #649
set nowritebackup
set cmdheight=2                                 " Better display for messages

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}
" }}}

" {{{ Settings
"
if has('nvim-0.4')
  set wildoptions=pum
  set pumblend=15
endif

set termguicolors
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
set inccommand=nosplit
set undofile
colorscheme Tomorrow-Night-Eighties
let g:netrw_banner=0
let g:rust_recommended_style = 0
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
nnoremap <silent> <leader>bm       :<C-u>Unite -buffer-name=buffers buffer<cr>
nnoremap <silent> <leader>bd       :<C-u>b#\|bd #<cr>
nnoremap <silent> <leader>bc       :<C-u>%bdelete<cr>
nnoremap <silent> <Leader>dw       :windo call DiffToggle()<CR>
nnoremap <silent> <Leader>du       :diffupdate<CR>
nnoremap <silent> <Leader>dg       :diffget<CR>
nnoremap <silent> <Leader>dp       :diffput<CR>
vnoremap <silent> <Leader>dl       :Linediff<CR>
nnoremap <silent> <Leader>dgl      :diffget LOCAL \| diffupdate<CR>
nnoremap <silent> <Leader>dgr      :diffget REMOTE \| diffupdate<CR>
nnoremap <silent> <Leader>dgb      :diffget BASE \| diffupdate<CR>
nnoremap <silent> <leader>e        :<C-u>25Lexplore<cr>
nnoremap <silent> <leader>ff       :<C-u>Files<cr>
nnoremap <silent> <leader>fo       :<C-u>Neoformat<cr>
vnoremap <silent> <leader>fo       :Neoformat<cr>
nnoremap          <leader>fr       :<C-u>Far  .<left><left>
nnoremap <silent> <leader>fe       :<C-u>FZF -e -m<cr>
nnoremap          <leader>Gd       :<C-u>Gdiff<cr>
nnoremap          <leader>GG       :<C-u>Gstatus<cr>
nnoremap          <leader>Gp       :<C-u>Gpush<cr>
nnoremap          <leader>Gb       :<C-u>Gblame<cr>
nnoremap          <leader>Ghr      :<C-u>GitGutterUndoHunk<cr>
nnoremap          <leader>Gha      :<C-u>GitGutterStageHunk<cr>
nnoremap          <leader>Ghp      :<C-u>GitGutterPreviewHunk<cr>
nnoremap          <leader>Gl       :<C-u>GV<cr>
nnoremap          <leader>GL       :<C-u>GV!<cr>
nnoremap          <leader>Gw       :<C-u>Gwrite<cr>
nnoremap          <leader>gg       :<C-u>F  **/*<left><left><left><left><left>
nnoremap          <leader>go       :<C-u>Unite -buffer-name=grep -no-empty grep:.:
nnoremap <silent> <leader>gr       :<C-u>UniteResume grep<cr>
nnoremap <silent> <leader>gb       :<C-u>Unite -buffer-name=grep -no-empty grep:$buffers<cr>
nnoremap          <leader>Hb       :<C-u>HGblame<cr>
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
nnoremap          <leader>x        :<C-u>call ToggleExpensiveUIFeatures()<cr>
nnoremap <silent> <leader>yd       :<C-u>let @+ = expand("%:p:h")<cr>
nnoremap <silent> <leader>yf       :<C-u>let @+ = expand("%:p") <cr>
tnoremap <Esc> <C-\><C-n>
"}}}

" {{{ Autocommands
au! BufWritePost $MYVIMRC nested source $MYVIMRC
au! BufEnter $MYVIMRC setlocal foldmethod=marker
au! Filetype scala,java,groovy,ruby,sh,zsh,vim,typescript,rust let &l:colorcolumn=81
au Filetype ruby setlocal re=1
au! VimResized * :wincmd =
au! FileType help,qf nnoremap <buffer> <silent>q :bd<cr>
au! Filetype man nnoremap <buffer> <silent> <leader>o :call man#show_toc()<cr><C-W>L:exec 'vertical resize '. string(&columns * 0.33)<cr>
au! BufNewFile,BufRead *.avsc set filetype=json
au BufRead,BufNewFile *.sbt set filetype=scala
" }}}
