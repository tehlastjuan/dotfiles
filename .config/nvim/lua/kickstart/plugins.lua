-- Default plugins

-- Install package manager / `:help lazy.nvim.txt` / https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- PLUGINS: configure plugins using the `config` key. You can also configure plugins after the setup call, as they will be available in your neovim runtime.
require('lazy').setup({
  -- No-conf plugins

  -- Git related
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- LSP Configuration & Plugins (more conf below)
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP. NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' }, },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Theme inspired by Atom
  {
   'navarasu/onedark.nvim',
   priority = 1000,
   config = function()
     vim.cmd.colorscheme 'onedark'
   end,
  },

  -- { 'lukas-reineke/onedark.nvim' },

  -- { 'NvChad/base46',
  --   config = function()
  --     local ok, base46 = pcall(require, "base46")
  --
  --     if ok then
  --       base46.load_theme()
  --     end
  --   end,
  -- },
  --
  -- { 'NvChad/ui',
  --   after = "base46",
  --   config = function()
  --     local present, nvchad_ui = pcall(require, "nvchad_ui")
  --
  --     if present then
  --       nvchad_ui.setup()
  --     end
  --   end,
  -- },

  -- Set lualine as statusline
  {
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = '',
        section_separators = '',
      },
    },
  },

  -- Add indentation guides even on blank lines / `:help indent_blankline.txt` 
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  -- Autopairs, integrates with both cmp and treesitter
  {
    "windwp/nvim-autopairs"
  },
  -- { "JoosepAlviste/nvim-ts-context-commentstring" },

  -- {
  --   'glepnir/dashboard-nvim',
  --   event = 'VimEnter',
  --   config = function()
  --     require('dashboard').setup {
  --       -- config
  --     }
  --   end,
  --   dependencies = { {'nvim-tree/nvim-web-devicons'}}
  -- },
  -- alpha-screen
  {
    'goolord/alpha-nvim'
  },
  -- web-icons
  {
    'kyazdani42/nvim-web-devicons'
  },
  -- file-tree
  {
    'kyazdani42/nvim-tree.lua'
  },
  -- file-info
  {
    'akinsho/bufferline.nvim'
  },
  -- remove-empty-buffers
  {
    "moll/vim-bbye"
  },
  -- nvim-terminal
  {
    'akinsho/toggleterm.nvim'
  },
  -- project-folders 
  { 'ahmedkhalf/project.nvim' },
  -- { "lewis6991/impatient.nvim" },
  -- { 'goolord/alpha-nvim' },
  -- Colorschemes
  -- { 'folke/tokyonight.nvim' },
  -- Snippets
  -- { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use
  -- Colorizer,
  {
    'norcalli/nvim-colorizer.lua'
  },
  --web-tools
  {
    'ray-x/web-tools.nvim'
  },
  --markdown preview
  {
    'iamcco/markdown-preview.nvim'
  },
  -- Import additional plugins
  -- { import = 'custom.plugins' },
  -- { import = 'custom' },

}, {})
