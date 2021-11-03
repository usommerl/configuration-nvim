local present, lualine = pcall(require, 'lualine')
if not present then
    return
end

lualine.setup {
  options = {
    section_separators = '',
    component_separators = ''
  },
  sections = { lualine_x = {'encoding', { 'fileformat', icons_enabled = false }, 'filetype'} }
}
