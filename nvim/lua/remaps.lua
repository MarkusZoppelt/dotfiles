local opts = { noremap = true, silent = true }

-- Harpoon
vim.keymap.set('n', '<space>m', function() require('harpoon.mark').add_file() end, opts)
vim.keymap.set('n', '<space>h', function() require('harpoon.ui').toggle_quick_menu() end, opts)
vim.keymap.set('n', '<space>1', function() require('harpoon.ui').nav_file(1) end, opts)
vim.keymap.set('n', '<space>2', function() require('harpoon.ui').nav_file(2) end, opts)
vim.keymap.set('n', '<space>3', function() require('harpoon.ui').nav_file(3) end, opts)
vim.keymap.set('n', '<space>4', function() require('harpoon.ui').nav_file(4) end, opts)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

-- Move lines in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('x', '<leader>p"', '"_dP')

-- Set leader y to copy to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
