require('settings')
require('maps')
require('plugins')

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

read_if_exists_and_then(os.getenv('HOME') .. '/.vimrc_background', vim.cmd)
