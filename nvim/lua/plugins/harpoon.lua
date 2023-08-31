return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<space>m", function() require('harpoon.mark').add_file() end },
        { "<space>h", function() require('harpoon.ui').toggle_quick_menu() end },
        { "<space>1", function() require('harpoon.ui').nav_file(1) end },
        { "<space>2", function() require('harpoon.ui').nav_file(2) end },
        { "<space>3", function() require('harpoon.ui').nav_file(3) end },
        { "<space>4", function() require('harpoon.ui').nav_file(4) end }
    }
}
