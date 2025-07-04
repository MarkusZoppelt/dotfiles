return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "gopls",
            "lua_ls",
            "nil_ls",
            "rust_analyzer",
        },
        automatic_enable = {
          exclude = {
            -- "clangd", -- Uncomment to disable clangd if it causes issues
          }
        }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
