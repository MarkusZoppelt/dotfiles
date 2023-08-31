return {
    "github/copilot.vim",
    event = { "InsertEnter", "CmdLineEnter"},
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end
}
