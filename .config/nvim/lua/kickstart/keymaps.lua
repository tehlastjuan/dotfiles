-- [ Basic Keymaps ]

-- Keymaps for better default experience / `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'Up'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'Down'", { expr = true, silent = true })
vim.keymap.set('n', "ft", vim.cmd.Lex, { desc = '[F]ile [T]ree' })
vim.keymap.set('n', "cb", vim.cmd.bd, { desc = '[C]lose [B]uffer' })
