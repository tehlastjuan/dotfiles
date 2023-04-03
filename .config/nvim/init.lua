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
