return {
    "folke/trouble.nvim",
    keys = {
      { "tt", "<cmd>TroubleToggle<CR>", desc = "Trouble" },
    },
    opts = {
        action_keys = {   -- key mappings for actions in the trouble list
            hover = "K",  -- opens a small popup with the full multiline message
        },
        multiline = true, -- render multi-line messages
        icons = false
    },
}
