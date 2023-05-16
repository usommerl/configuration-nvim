function read_if_exists_and_then(filename, f)
  local file = io.open(filename, 'r')
  if file then
    local content = file:read('*all')
    file:close()
    f(content)
  else
    vim.notify('File not found: ' .. filename, vim.log.levels.WARN)
  end
end

function diff_toggle()
  if vim.api.nvim_win_get_option(0, 'diff') then
    vim.cmd('windo diffoff')
  else
    vim.cmd('windo diffthis')
  end
end
