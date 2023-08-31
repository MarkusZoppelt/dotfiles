return {
    "ray-x/go.nvim",
    dependencies = {
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("go").setup({
            goimport = 'gopls',
            fillstruct = 'gopls',
            gofmt = 'gopls',
            max_line_len = 120
        })

        -- Run gofmt + goimport on save
        local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
                require('go.format').goimport()
            end,
            group = format_sync_grp,
        })
    end,
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()'
}
