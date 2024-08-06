return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim"
    },
    config = function()
        require('mason').setup()
        local lspconfig = require('lspconfig')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('mason-lspconfig').setup({
            ensure_installed = {
                'tsserver',
                'gopls',
                'rust_analyzer',
            }
        })
        require('mason-lspconfig').setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = lsp_capabilities,
                })
            end,
        })

        -- Manually setup clangd to ensure it uses the version from PATH
        require 'lspconfig'.clangd.setup {
            capabilities = lsp_capabilities,
        }
    end
}
