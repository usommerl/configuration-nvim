" {{{ Functions
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
Plug 'arcticicestudio/nord-vim'
" }}}
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'cohama/lexima.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'liuchengxu/vim-clap'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() } }
Plug 'sbdchd/neoformat', { 'do': 'yarn global add js-beautify prettier typescript-formatter' }
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
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
" {{{ vim-clap
let g:clap_disable_run_from_project_root = v:true
" }}}
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
" {{{ Neoformat
let g:neoformat_enabled_typescript = ['prettier', 'tsfmt']
let g:neoformat_enabled_scss = ['prettier']
" }}}
" {{{ coc.vim

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

" Remap keys for gotos
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

nmap     <leader> a         <Plug>(coc-codeaction)
nnoremap <silent> F         :call CocAction('format')<CR>
nnoremap <silent> K         :call <SID>show_documentation()<CR>

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}
" }}}
" }}}

" {{{ Settings
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
nnoremap <silent> <Leader>dw       :windo call DiffToggle()<CR>
nnoremap <silent> <Leader>du       :diffupdate<CR>
nnoremap <silent> <Leader>dg       :diffget<CR>
nnoremap <silent> <Leader>dp       :diffput<CR>
vnoremap <silent> <Leader>dl       :Linediff<CR>
nnoremap <silent> <Leader>dgl      :diffget LOCAL \| diffupdate<CR>
nnoremap <silent> <Leader>dgr      :diffget REMOTE \| diffupdate<CR>
nnoremap <silent> <Leader>dgb      :diffget BASE \| diffupdate<CR>
nnoremap <silent> <leader>e        :<C-u>25Lexplore<cr>
nnoremap <silent> <leader>fb       :<C-u>Clap buffers<cr>
nnoremap <silent> <leader>fr       :<C-u>Clap history<cr>
nnoremap <silent> <leader>ff       :<C-u>Clap files<cr>
nnoremap <silent> <leader>fg       :<C-u>Clap grep<cr>
nnoremap <silent> <leader>fh       :<C-u>Clap command_history<cr>
nnoremap <silent> <leader>fl       :<C-u>Clap blines<cr>
nnoremap <silent> <leader>fo       :<C-u>Neoformat<cr>
vnoremap <silent> <leader>fo       :Neoformat<cr>
nnoremap          <leader>gd       :<C-u>Gdiff<cr>
nnoremap          <leader>gg       :<C-u>Gstatus<cr>
nnoremap          <leader>gp       :<C-u>Gpush<cr>
nnoremap          <leader>gb       :<C-u>Gblame<cr>
nnoremap          <leader>gL       :<C-u>GV<cr>
nnoremap          <leader>gl       :<C-u>GV!<cr>
nnoremap          <leader>gw       :<C-u>Gwrite<cr>
nnoremap          <leader>hb       :<C-u>HGblame<cr>
nnoremap          <leader>l        :setlocal list!<cr>
nnoremap          <leader>r<space> :<C-u>%s/\s\+$/<cr>
vnoremap          <leader>r<space> :s/\s\+$/<cr>
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
au! Filetype scala,java,groovy,ruby,sh,zsh,typescript,rust let &l:colorcolumn=81
au Filetype ruby setlocal re=1
au! VimResized * :wincmd =
au! FileType help,qf nnoremap <buffer> <silent>q :bd<cr>
au! Filetype man nnoremap <buffer> <silent> <leader>o :call man#show_toc()<cr><C-W>L:exec 'vertical resize '. string(&columns * 0.33)<cr>
au! BufNewFile,BufRead *.avsc set filetype=json
au BufRead,BufNewFile *.sbt set filetype=scala
" }}}
