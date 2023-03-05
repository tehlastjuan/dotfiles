-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- return {
require('lazy').setup({

  -- { "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
  -- { "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter
  -- { "JoosepAlviste/nvim-ts-context-commentstring" },

  -- { "kyazdani42/nvim-web-devicons" },

  -- { "kyazdani42/nvim-tree.lua" },

  -- { "akinsho/bufferline.nvim" },

  -- { "moll/vim-bbye" },

  -- { "akinsho/toggleterm.nvim" },

  -- { "ahmedkhalf/project.nvim" },

  -- { "lewis6991/impatient.nvim" },

  -- { "goolord/alpha-nvim" },

  -- Colorschemes
  {
    'folke/tokyonight.nvim'
  },

  -- Snippets
  -- { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

  -- Colorizer,
  -- { "norcalli/nvim-colorizer.lua" },

  --web-tools
  -- { "ray-x/web-tools.nvim" },

  --markdown preview
  -- { "iamcco/markdown-preview.nvim" },

  --java
  --use { "mfussenegger/nvim-jdtls" }

}, {})
-- }
