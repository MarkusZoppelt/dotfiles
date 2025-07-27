return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = { clangd = { mason = false } } -- disable mason for clangd
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = bufnr, silent = true }
                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

                vim.keymap.set('n', '<space>df', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
                vim.keymap.set('n', '<space>dl', '<cmd>Telescope diagnostics<cr>', opts)
                vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
                vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
            end
        })

        -- Manually setup clangd to ensure it uses the version from PATH
        local lsp_capabilities = require 'cmp_nvim_lsp'.default_capabilities()
        vim.lsp.config('clangd', {
            capabilities = lsp_capabilities,
        })

        vim.lsp.config('rust_analyzer', {
            -- Server-specific settings. See `:help lsp-quickstart`
            settings = {
                ['rust-analyzer'] = {
                    -- disable the default inlay hints
                    inlayHints = {
                        chainingHints = false,
                        closureReturnTypeHints = false,
                        lifetimeElisionHints = {
                            enable = false,
                        },
                        parameterHints = false,
                        typeHints = false,
                    },
                },
            },
        })

        vim.diagnostic.config({
            virtual_text = true
        })
    end
}
