local map = vim.api.nvim_set_keymap
local nor = { noremap = true }
local nrs = { noremap = true, silent = true }
local nre = { noremap = true, expr = true }

vim.g.mapleader = ','

-- better up/down
map('n', 'j', 'gj', nor)
map('n', 'k', 'gk', nor)

-- Move to windows
map('n', '<C-h>', '<C-w>h', nor)
map('n', '<C-j>', '<C-w>j', nor)
map('n', '<C-k>', '<C-w>k', nor)
map('n', '<C-l>', '<C-w>l', nor)

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", nor)
map("n", "<A-k>", "<cmd>m .-2<cr>==", nor)
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", nor)
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", nor)
map("v", "<A-j>", ":m '>+1<cr>gv=gv", nor)
map("v", "<A-k>", ":m '<-2<cr>gv=gv", nor)

-- Git
map('n', '<leader>gd', ':<C-u>Gdiffsplit<cr>', nrs)
map('n', '<leader>gg', ':<C-u>Git<cr><C-w>o', nrs)
map('n', '<leader>gl', ':<C-u>Telescope git_commits<cr>', nrs)
map('n', '<leader>gL', ':<C-u>Telescope git_bcommits<cr>', nrs)
map('n', '<leader>gps', ':<C-u>Git push<cr>', nrs)
map('n', '<leader>gpl', ':<C-u>Git pull<cr>', nrs)
map('n', '<leader>gb', ':<C-u>Telescope git_branches<cr>', nrs)
map('n', '<leader>gB', ':<C-u>Git blame<cr>', nrs)

map('c', '%%', 'getcmdtype() == ":" ? expand("%:h")."/" : "%%"', nre)
map('n', '<leader><esc>', '<cmd>nohl<cr>', nrs)
map('n', '+', '<c-a>', nor)
map('n', '-', '<c-x>', nor)
map('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', nrs)
map('n', 'gr', ':lua vim.lsp.buf.references()<cr>', nrs)
map('n', 'go', ':SymbolsOutline<cr>', nrs)
map('n', 'K', ':lua vim.lsp.buf.hover()<cr>', nrs)
map('n', '<c-e>', '6<c-e>', nor)
map('n', '<c-y>', '6<c-y>', nor)
map('n', '<A-h>', ':SidewaysLeft<cr>', nor)
map('n', '<A-l>', ':SidewaysRight<cr>', nor)
map('n', '<leader>.', ':b#<cr>', nrs)
map('n', '<leader>,', ':lua vim.lsp.buf.code_action()<cr>', nrs)
map('n', '<leader>l', ':Lazy<cr>', nrs)
map('n', '<leader>dw', ':lua diff_toggle()<cr>', nrs)
map('n', '<leader>dl', ':Linediff<cr>', nrs)
map('v', '<leader>dl', ':Linediff<cr>', nrs)
map('n', '<leader>e', ':NvimTreeFindFileToggle<cr>', nrs)
map('n', '<leader>fb', ':Telescope buffers<cr>', nrs)
map('n', '<leader>fc', ':Telescope colorscheme<cr>', nrs)
map('n', '<leader>ff', ':Telescope find_files<cr>', nrs)
map('n', '<leader>fg', ':Telescope live_grep<cr>', nrs)
map('n', '<leader>fk', ':Telescope keymaps<cr>', nrs)
map('n', '<leader>fm', ':Telescope metals commands<cr>', nrs)
map('n', '<leader>fn', ':Noice telescope<cr>', nrs)
map('n', '<leader>fr', ':Telescope frecency<cr>', nrs)
map('n', '<leader>fR', ':Telescope registers<cr>', nrs)
map('n', '<leader>o', ':SymbolsOutline<cr>', nrs)
map('n', 'Z', ':Telescope zoxide list<cr>', nrs)
map('n', '<leader>r<space>', ':<c-u>%s/\\s\\+$/<cr>', nor)
map('n', '<leader>re', ':lua vim.lsp.buf.rename()<cr>', nrs)
map('n', '<leader>sl', ':<c-u>setlocal list!<cr>', nor)
map('n', '<leader>sw', ':<c-u>set wrap!<cr>', nor)
map('n', '<leader>tn', ':<c-u>tabnew<cr>', nor)
map('n', '<leader>td', ':<c-u>tabclose<cr>', nor)
map('n', '<leader>u', ':Telescope undo<cr>', nrs)
map('n', '<leader>w', ':<c-u>Win<cr>', nrs)
map('n', '<leader>xx', ':TroubleToggle<cr>', nrs)
map('n', '<leader>yd', ':<c-u>let @+ = expand("%:p:h")<cr>', nor)
map('n', '<leader>yff', ':<c-u>let @+ = expand("%:p")<cr>', nor)
map('n', '<leader>yfn', ':<c-u>let @+ = expand("%:p") . ":" . line(".")<cr>', nor)
map('t', '<Esc>', '<C-\\><C-n>', nor)
