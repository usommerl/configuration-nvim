" {{{ Functions
function! MyFoldText()
  let linetext = substitute(getline(v:foldstart),"^ *","",1)
  let text_without_fold_markers = substitute(linetext, '.*{\{3}\s*', '', 'g')
  return '-- ' . text_without_fold_markers . ' '
endfunction

function! LightlineColorscheme(name)
  let g:lightline.colorscheme = a:name
  call lightline#init()
  call lightline#colorscheme()
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
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'jacoborus/tender'
Plug 'junegunn/seoul256.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'noah/vim256-color'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhartington/oceanic-next'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
" }}}
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'cohama/lexima.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/lightline.vim'
Plug 'josa42/coc-sh', {'tag': '*', 'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'
Plug 'lambdalisue/suda.vim'
Plug 'liuchengxu/vim-clap', { 'tag': '*', 'do': { -> ':Clap install-binary!' } }
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'tag': '*', 'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'tag': '*', 'do': 'yarn install --frozen-lockfile'}
Plug 'scalameta/coc-metals', {'tag': '*', 'do': 'yarn install --frozen-lockfile'}
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'Konfekt/FastFold'
Plug 'kopischke/vim-stay'
Plug 'kopischke/vim-fetch'
Plug 'vifm/vifm.vim'
Plug 'vim-scripts/bats.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim' " ^^^ plantuml-previewer dependency
Plug 'dstein64/vim-win'
Plug 'Yggdroot/indentLine'
call plug#end()
" {{{ Plugin Settings
" {{{ vim-clap
let g:clap_disable_run_from_project_root = v:true
let g:clap_layout = { 'relative': 'editor', 'width': '90%', 'col': '5%' }
let g:clap_provider_grep_opts = '-H --no-heading --vimgrep --smart-case --hidden -g !.git*'
let g:clap_use_pure_python = 1
" }}}
" {{{ vifm
if executable('vifm')
  let g:vifm_exec_args     = '-c "nnoremap q :q!<cr>" -c "nnoremap ,e :q!<cr>" -c "set nols" -c "only" -c "set ruf= "'
  let g:vifm_embed_split   = 1
  let g:vifm_replace_netrw = 1
  let g:loaded_netrw       = 1
  let g:loaded_netrwPlugin = 1
endif
" }}}
" {{{ IndentLine
let g:indentLine_char = '┊'
let g:indentLine_noConcealCursor=1
let g:indentLine_fileTypeExclude = ['text', 'help', 'markdown']
" }}}
" {{{ Peekaboo
let g:peekaboo_window = 'vertical botright 70new'
" }}}
" {{{ Undotree
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
" }}}
" {{{ FastFold
let g:is_bash = 1
let g:sh_fold_enabled = 7
let g:ruby_fold = 1
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
" }}}
" {{{ Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [['fugitive', 'filename', 'modified'], ['cocstatus']],
      \   'right': [[], ['percent', 'lineinfo'], ['fileformat', 'fileencoding', 'filetype']]
      \ },
      \ 'inactive': {
      \   'left': [['filename', 'modified']],
      \   'right': [[], ['percent', 'lineinfo'], []]
      \ },
      \ 'component_function': {
      \   'fugitive': 'FugitiveHead',
      \   'cocstatus': 'LightLineCocStatus'
      \ }
      \ }

function! LightLineCocStatus()
  return exists('*coc#status') ? coc#status() : ''
endfunction
" }}}
" {{{ Neoformat
let g:neoformat_verbose = 0
let g:neoformat_enabled_typescript = ['prettier', 'tsfmt']
let g:neoformat_enabled_scss = ['prettier']
let g:neoformat_verbose = 0
" }}}
" {{{ coc.vim

let mapleader = ","
set updatetime=300                              " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c                                " don't give |ins-completion-menu| messages.
set signcolumn=yes:2                            " always show signcolumns
set nobackup                                    " Some server have issues with backup files, see #649
set nowritebackup
set cmdheight=2                                 " Better display for messages

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


nmap                      gd <Plug>(coc-definition)
nmap                      gy <Plug>(coc-type-definition)
nmap                      gi <Plug>(coc-implementation)
nmap                      gr <Plug>(coc-references)

nmap              <leader>ac <Plug>(coc-codeaction)
nmap              <leader>,  :<C-u>CocFix<cr>
nmap              <leader>re <Plug>(coc-rename)

nnoremap <silent>        gh  :call <SID>show_documentation()<CR>
nnoremap <silent>  <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent>  <space>c  :<C-u>CocList commands<cr>
nnoremap <silent>  <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent>  <space>o  :<C-u>CocList outline<cr>
nnoremap <silent>  <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent>  <space>j  :<C-u>CocNext<CR>
nnoremap <silent>  <space>k  :<C-u>CocPrev<CR>
nnoremap <silent>  <space>p  :<C-u>CocListResume<CR>
" }}}
" }}}
" }}}

" {{{ Settings
set title
set pumblend=15
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
let g:netrw_banner=0
let g:rust_recommended_style = 0
" }}}

" {{{ Keys
let mapleader = ","
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nnoremap                  +        <C-a>
nnoremap                  -        <C-x>
nnoremap <silent> <C-l>            :<C-u>nohlsearch<cr><C-l>
nnoremap          <m-h>            :SidewaysLeft<cr>
nnoremap          <m-l>            :SidewaysRight<cr>
nnoremap          <C-e>            6<C-e>
nnoremap          <C-y>            6<C-y>
nnoremap <silent> <C-M-L>          :<C-u>Neoformat<cr>
vnoremap <silent> <C-M-L>          :Neoformat<cr>
nnoremap          <leader>.        :b#<cr>
nnoremap <silent> <Leader>dw       :windo call DiffToggle()<CR>
nnoremap <silent> <Leader>du       :diffupdate<CR>
nnoremap <silent> <Leader>dg       :diffget<CR>
nnoremap <silent> <Leader>dp       :diffput<CR>
vnoremap <silent> <Leader>dl       :Linediff<CR>
nnoremap <silent> <Leader>dgl      :diffget LOCAL \| diffupdate<CR>
nnoremap <silent> <Leader>dgr      :diffget REMOTE \| diffupdate<CR>
nnoremap <silent> <Leader>dgb      :diffget BASE \| diffupdate<CR>

if executable('vifm')
  nnoremap <silent> <leader>e      :<C-u>vertical Vifm \| vertical resize 60 \|setlocal nonu nornu<cr>
else
  nnoremap <silent> <leader>e      :<C-u>25Lexplore<cr>
endif

nnoremap <silent> <leader>fb       :<C-u>Clap buffers<cr>
nnoremap <silent> <Leader>fc       :<C-u>Clap colors<cr>
nnoremap <silent> <leader>fr       :<C-u>Clap history<cr>
nnoremap <silent> <leader>ff       :<C-u>Clap files --hidden +async<cr>
nnoremap <silent> <leader>fg       :<C-u>Clap grep2<cr>
nnoremap <silent> <leader>fh       :<C-u>Clap command_history<cr>
nnoremap <silent> <leader>fl       :<C-u>Clap blines<cr>
nnoremap <silent> <leader>fy       :<C-u>Clap yanks<cr>
nnoremap          <leader>gd       :<C-u>Gdiff<cr>
nnoremap          <leader>gg       :<C-u>Gstatus<cr>
nnoremap          <leader>gc       :<C-u>Git commit -v<cr>
nnoremap          <leader>gps      :<C-u>Git push<cr>
nnoremap          <leader>gpl      :<C-u>Git pull<cr>
nnoremap          <leader>gb       :<C-u>Gblame<cr>
nnoremap          <leader>gL       :<C-u>GV<cr>
nnoremap          <leader>gl       :<C-u>GV!<cr>
nnoremap          <leader>gw       :<C-u>Gwrite<cr>
nnoremap          <leader>r<space> :<C-u>%s/\s\+$/<cr>
vnoremap          <leader>r<space> :s/\s\+$/<cr>
nnoremap          <leader>sw       :<C-u>set wrap!<cr>
nnoremap          <leader>sl       :<C-u>setlocal list!<cr>
nnoremap          <leader>tn       :<C-u>tabnew<cr>
nnoremap          <leader>td       :<C-u>tabclose<cr>
nnoremap          <leader>u        :<C-u>:UndotreeToggle<cr>
nnoremap          <leader>x        :<C-u>call ToggleExpensiveUIFeatures()<cr>
nnoremap <silent> <leader>yd       :<C-u>let @+ = expand("%:p:h")<cr>
nnoremap <silent> <leader>yff      :<C-u>let @+ = expand("%:p")<cr>
nnoremap <silent> <leader>yfn      :<C-u>let @+ = expand("%:p") . ':' . line(".")<CR>
tnoremap <Esc> <C-\><C-n>
"}}}

" {{{ Autocommands & Colorscheme
au! BufWritePost $MYVIMRC nested source $MYVIMRC
au! BufEnter $MYVIMRC,config.fish setlocal foldmethod=marker
au BufEnter * let &titlestring = "nvim " . expand("%:p")
au Filetype ruby setlocal re=1
au! VimResized * :wincmd =
au! FileType help,qf nnoremap <buffer> <silent>q :bd<cr>
au! Filetype man nnoremap <buffer> <silent> <leader>o :call man#show_toc()<cr><C-W>L:exec 'vertical resize '. string(&columns * 0.33)<cr>
au BufNewFile,BufRead *.avsc set filetype=json
au BufNewFile,BufRead *.envrc set filetype=sh
au BufRead,BufNewFile *.sbt set filetype=scala

augroup LightlineColorscheme
  autocmd!
  autocmd ColorSchemePre nord call LightlineColorscheme('nord')
  autocmd ColorSchemePre Tomorrow,bubblegum-256-light call LightlineColorscheme('Tomorrow')
  autocmd ColorSchemePre Tomorrow-Night-Eighties,bubblegum-256-dark call LightlineColorscheme('Tomorrow_Night_Eighties')
  autocmd ColorSchemePre OceanicNext call LightlineColorscheme('material')
  autocmd ColorSchemePre seoul256 call LightlineColorscheme('seoul256')
  autocmd ColorSchemePre one call LightlineColorscheme('one')
  autocmd ColorSchemePre nightfly call LightlineColorscheme('nightfly')
  autocmd ColorSchemePre material call LightlineColorscheme('material')
  autocmd ColorSchemePre dracula set bg=dark | call LightlineColorscheme('dracula')
  autocmd ColorSchemePre pencil set bg=light | call LightlineColorscheme('Tomorrow')
  autocmd ColorSchemePre PaperColor set bg=light | call LightlineColorscheme('PaperColor')
augroup END

if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

" Workaround for weird materila theme highlight
exec 'hi MatchParen guifg=red guibg=none gui=none cterm=none'
" }}}
