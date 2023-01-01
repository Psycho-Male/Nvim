return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    --https://github.com/nvim-telescope/telescope.nvim
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'BurntSushi/ripgrep'
    use 'sharkdp/fd'

    --https://github.com/hrsh7th/nvim-cmp
    --use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    --use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    --https://github.com/hrsh7th/vim-vsnip
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    --https://github.com/petertriho/cmp-git
    use 'petertriho/cmp-git'

    --https://github.com/nvim-treesitter/nvim-treesitter
    --use 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    --https://github.com/windwp/nvim-autopairs
    --use 'windwp/nvim-autopairs'

    --https://github.com/kyazdani42/nvim-tree.lua
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {'nvim-tree/nvim-web-devicons'}, -- optional, for file icons
        config = function() require('nvim-tree').setup() end
    }

    --https://github.com/mileszs/ack.vim
    use 'mileszs/ack.vim'

    --https://github.com/GameMakerDiscord/gml-tools-langserver
    --use 'GameMakerDiscord/gml-tools-langserver'

    --https://github.com/jlanzarotta/bufexplorer
    use 'jlanzarotta/bufexplorer'


    --Auto save https://github.com/Pocco81/auto-save.nvim
    use 'Pocco81/auto-save.nvim'

    --Lualine https://github.com/nvim-lualine/lualine.nvim
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require('lualine').setup() end
    }

    use({ "kelly-lin/telescope-ag", requires = { { "nvim-telescope/telescope.nvim" } } })

end)
