--Plugin Manager: https://github.com/junegunn/vim-plug
call plug#begin(stdpath("config") . "/plug")

--https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'

--https://github.com/hrsh7th/nvim-cmp
--Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
--Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

--https://github.com/hrsh7th/vim-vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

--https://github.com/petertriho/cmp-git
Plug 'petertriho/cmp-git'

--https://github.com/nvim-treesitter/nvim-treesitter
--Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

--https://github.com/windwp/nvim-autopairs
--Plug 'windwp/nvim-autopairs'

--https://github.com/kyazdani42/nvim-tree.lua
Plug 'kyazdani42/nvim-web-devicons' -- optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

--https://github.com/mileszs/ack.vim
Plug 'mileszs/ack.vim'

--https://github.com/GameMakerDiscord/gml-tools-langserver
--Plug 'GameMakerDiscord/gml-tools-langserver'

--https://github.com/jlanzarotta/bufexplorer
Plug 'jlanzarotta/bufexplorer'


--Auto save https://github.com/Pocco81/auto-save.nvim
Plug 'Pocco81/auto-save.nvim'

--Lualine https://github.com/nvim-lualine/lualine.nvim
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

require('lualine').setup();
require("nvim-tree").setup()

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


vim.o.set completeopt=menu,menuone,noselect

  -- Setup nvim-cmp.
local cmp = require('cmp')
local cmp_buffer = require('cmp_buffer')

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  end,
},
window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<S-TAB>'] = cmp.mapping.select_prev_item(),
  ['<TAB>'] = cmp.mapping.select_next_item(),
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'cmp-buffer' },
  { name = 'vsnip' }, -- For vsnip users.
}, {
  { name = 'buffer' },
})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
  { name = 'buffer' },
})
})



--AG The Silver Seacher
vim.o.let g:ackprg='ag --nogroup --nocolor --column'
