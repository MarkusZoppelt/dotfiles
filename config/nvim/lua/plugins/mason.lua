return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "mason-org/mason.nvim"
    },
    config = function()
        require('mason').setup()
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('mason-lspconfig').setup({
            ensure_installed = {
                'gopls',
                'rust_analyzer',
                'ts_ls',
            }
        })

        -- Manually setup clangd to ensure it uses the version from PATH
        require 'lspconfig'.clangd.setup {
            capabilities = lsp_capabilities,
        }
    end
}
