local map = vim.api.nvim_set_keymap
local nor = { noremap = true }
local nrs = { noremap = true, silent = true }
local nre = { noremap = true, expr = true }

vim.g.mapleader = ','

map('c', '%%'               , 'getcmdtype() == ":" ? expand("%:h")."/" : "%%"'    , nre)
map('n', '+'                , '<c-a>'                                             , nor)
map('n', '-'                , '<c-x>'                                             , nor)
map('n', 'gd'               , ':lua vim.lsp.buf.definition()<cr>'                 , nrs)
map('n', 'K'                , ':lua vim.lsp.buf.hover()<cr>'                      , nrs)
map('n', '<c-l>'            , ':<c-u>nohlsearch<cr><c-l>'                         , nrs)
map('n', '<c-e>'            , '6<c-e>'                                            , nor)
map('n', '<c-y>'            , '6<c-y>'                                            , nor)
map('n', '<m-h>'            , ':SidewaysLeft<cr>'                                 , nor)
map('n', '<m-l>'            , ':SidewaysRight<cr>'                                , nor)
map('n', '<leader>.'        , ':b#<cr>'                                           , nor)
map('n', '<leader>ca'       , ':lua vim.lsp.buf.code_action()<cr>'                , nrs)
map('n', '<leader>dw'       , ':lua diff_toggle()<cr>'                            , nrs)
map('n', '<leader>e'        , ':NvimTreeToggle<cr>'                               , nrs)
map('n', '<leader>fb'       , ':Telescope buffers<cr>'                            , nrs)
map('n', '<leader>fc'       , ':Telescope colorscheme<cr>'                        , nrs)
map('n', '<leader>ff'       , ':Telescope find_files<cr>'                         , nrs)
map('n', '<leader>fg'       , ':Telescope live_grep<cr>'                          , nrs)
map('n', '<leader>fk'       , ':Telescope keymaps<cr>'                            , nrs)
map('n', '<leader>fm'       , ':Telescope metals commands<cr>'                    , nrs)
map('n', '<leader>fr'       , ':Telescope registers<cr>'                          , nrs)
map('n', '<leader>fz'       , ':Telescope zoxide list<cr>'                        , nrs)
map('n', '<leader>r<space>' , ':<c-u>%s/\\s\\+$/<cr>'                             , nor)
map('n', '<leader>re'       , ':lua vim.lsp.buf.rename()<cr>'                     , nrs)
map('n', '<leader>sl'       , ':<c-u>setlocal list!<cr>'                          , nor)
map('n', '<leader>sw'       , ':<c-u>set wrap!<cr>'                               , nor)
map('n', '<leader>tn'       , ':<c-u>tabnew<cr>'                                  , nor)
map('n', '<leader>td'       , ':<c-u>tabclose<cr>'                                , nor)
map('n', '<leader>xx'       , ':TroubleToggle<cr>'                                , nrs)
map('n', '<leader>yd'       , ':<c-u>let @+ = expand("%:p:h")<cr>'                , nor)
map('n', '<leader>yff'      , ':<c-u>let @+ = expand("%:p")<cr>'                  , nor)
map('n', '<leader>yfn'      , ':<c-u>let @+ = expand("%:p") . ":" . line(".")<cr>', nor)
