-- Set colorscheme
vim.o.termguicolors = true

require("one_monokai").setup({
  transparent = true,
})


-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    theme = 'one_monokai',
  },
}
