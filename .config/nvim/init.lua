-- uggcf://yrneakvalzvahgrf.pbz/qbpf/yhn/

-- Set <space> as the leader key / `:help mapleader` NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require"kickstart.plugins"

require"kickstart.options"
require"custom.options"
require"kickstart.keymaps"
require"custom.keymaps"

require"kickstart.plugins.lsp"
require"kickstart.plugins.mason"
require"kickstart.plugins.telescope"
require"kickstart.plugins.treesitter"
require"kickstart.plugins.lsp"
require"kickstart.plugins.cmp"

require"custom.plugins.alpha"
require"custom.plugins.toggleterm"
require"custom.plugins.nvim-tree"
require"custom.plugins.whichkey"
require"custom.plugins.bufferline"
require"custom.plugins.colorscheme"
require"custom.plugins.project"
require"custom.plugins.custom"
-- require"onedark-lukas.onedark"
-- require"base46.themes.onedark"

-- Import additional plugins
-- { import = 'custom.plugins' }

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
  --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
