return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
    },
    config = function()
        local cmp = require('cmp')
        cmp.setup({
            sources = {
                { name = 'nvim_lsp' },
            },
            mapping = {
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<C-Space>'] = cmp.mapping.complete(),
            },
            window = {
                completion = {
                    border = 'rounded'
                }
            },
        })
    end
}
