local o=vim.o
local bo=vim.bo
local wo=vim.wo

o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = false bo.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath('config') .. '/undodir'
o.undofile = true
o.incsearch = true
o.hidden = true
o.completeopt='menuone,noinsert,noselect'
bo.autoindent = true
bo.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
wo.number = true
wo.relativenumber = false
wo.wrap = false

vim.g.mapleader = ','

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

packer.startup(function()
  local use = use

  use {
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true}
  }


  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'ntk148v/vim-horizon'
  use 'tjdevries/colorbuddy.vim'
  use 'tjdevries/gruvbuddy.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'
  use 'bkegley/gloombuddy'

  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'anott03/nvim-lspinstall'
  use 'nvim-lua/plenary.nvim'
  use 'tjdevries/express_line.nvim'
  use 'preservim/nerdtree'
  use 'nvim-lua/popup.nvim'
  use 'romgrk/doom-one.vim'
  use 'nvim-lua/telescope.nvim'
  use 'Th3Whit3Wolf/one-nvim'
  use 'onsails/lspkind-nvim'
  use 'ryanoasis/vim-devicons'
  use {'challenger-deep-theme/vim', as = 'challenger-deep'}
  -- use 'tjdevries/cyclist.vim'
  use 'tpope/vim-commentary'
  end
)

require('colorbuddy').colorscheme('gruvbuddy')
-- vim.g.colors_name="doom-one"

local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  }
}

local function setup_diagnostics()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = false,
      signs = true,
      update_in_insert = true,
    }
  )
end


local lspconfig = require'lspconfig'
local completion = require'completion'
local function custom_on_attach(client)
  print('Attaching to ' .. client.name)
  completion.on_attach(client)
  setup_diagnostics()
end
local default_config = {
  on_attach = custom_on_attach,
}
-- setup language servers here
lspconfig.tsserver.setup(default_config)
lspconfig.pyright.setup(default_config)
lspconfig.intelephense.setup(default_config)
lspconfig.gopls.setup(default_config)
require('el').setup {}
require'jacob'
