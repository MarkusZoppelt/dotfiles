-- Rust Setup
local nvim_lsp = require 'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = ""
        }
    },
}

require('rust-tools').setup(opts)

local cmp = require 'cmp'
cmp.setup({
    -- Enable LSP snippets
    snippet = {expand = function(args) vim.fn["vsnip#anonymous"](args.body) end},
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        })
    },

    -- Installed sources
    sources = {
        {name = 'nvim_lsp'}, {name = 'vsnip'}, {name = 'path'},
        {name = 'buffer'}
    }
})

vim.keymap.set('n', 'K', '<cmd>RustHoverActions<CR>', {noremap = true})
vim.keymap.set('n', 'ca', '<cmd>RustCodeAction<CR>', {noremap = true})

vim.g.rustfmt_command = "rustfmt"
vim.g.rustfmt_autosave = 1
vim.g.rustfmt_emit_files = 1
