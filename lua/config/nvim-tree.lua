local present, nvim_tree = pcall(require, 'nvim-tree')
if not present then
    return
end

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

nvim_tree.setup {
  hijack_cursor = true,
  respect_buf_cwd = true,
  view = {
    width = 60,
    mappings = {
      list = {
        { key = {'l', '<cr>'}, cb = tree_cb('edit') },
        { key = 'w',           cb = tree_cb('preview') },
        { key = 'h',           cb = tree_cb('parent_node') },
      }
    }
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  }
}
