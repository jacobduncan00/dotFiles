local vim = vim
local utils = require'jacob.utils'

local setup_mappings = function()

  -- Completion
  vim.cmd[[inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"]]
  vim.cmd[[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]]
  vim.cmd[[inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]]

  utils.key_mapper('n', '<leader>h', ':lua vim.lsp.buf.hover()<CR>')
  utils.key_mapper('n', '<leader>cc', ':Commentary<CR>')

  utils.key_mapper('n', '<leader>ff', ':lua require"jacob.telescope".find_files()<CR>')
  utils.key_mapper('n', '<leader>gf', ':lua require"jacob.telescope".git_files()<CR>')
  utils.key_mapper('n', '<leader>df', ':lua require"jacob.telescope".edit_neovim()<CR>')
  utils.key_mapper('n', '<leader>fs', ':lua require"jacob.telescope".edit_src()<CR>')


  utils.key_mapper('n', '<leader>dn', ':lua vim.lsp.diagnostic.goto_next()<CR>')
  utils.key_mapper('n', '<leader>dp', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
  utils.key_mapper('n', '<leader>ds', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')

  -- Nerdtree
  utils.key_mapper('n', '<leader><TAB>', ':NERDTreeToggle<CR>')

  -- Navigation
  utils.key_mapper('n', '<leader>a', ':wincmd h<CR>')
  utils.key_mapper('n', '<leader>s', ':wincmd l<CR>')
  utils.key_mapper('n', '<leader>+', ':vertical resize +5<CR>')
  utils.key_mapper('n', '<leader>-', ':vertical resize -5<CR>')

end

setup_mappings()
