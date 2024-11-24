require('lazy').setup({

  {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  dependencies = { {'nvim-lua/plenary.nvim'}, }
  },

  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  'mbbill/undotree',

  -- LSP using lsp-zero -------------------------
  use {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  }
}
 -------------------------- ------------------------

 -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',

  'navarasu/onedark.nvim' -- Theme inspired by Atom,
  'nvim-lualine/lualine.nvim' -- Fancier statusline,
  -- 'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
  'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines,
  'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically,
  'folke/zen-mode.nvim' -- Clean focus mode,

})
