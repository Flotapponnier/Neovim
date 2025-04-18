return
    {
        "ibhagwan/fzf-lua",
        --dependencies = { "nvim-tree/nvim-web-devicons" },
        -- dependencies = { "echasnovski/mini.icons" },
        opts = {},
        keys=
        {
            { 
                "<leader>ff",
                function() require('fzf-lua').files() end,
                desc="Find Files in project directory"
            }
        },
    }
