local present, nvim_tree = pcall(require, 'nvim-tree')
if not present then
    return
end

vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_respect_buf_cwd = 1

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

nvim_tree.setup {
  view = {
    width = 60,
    hijack_cursor = true,
    mappings = {
      list = {
        { key = {'l', '<cr>'}, cb = tree_cb('edit') },
        { key = 'w',           cb = tree_cb('preview') },
        { key = 'h',           cb = tree_cb('parent_node') },
      }
    }
  }
}
