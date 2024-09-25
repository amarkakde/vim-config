return {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                window = {
                    width = 25
                },
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false, -- 'false' closes auto exapanded dir
                }, -- update the focused file in neotree
                hijack_netrw_behaviour = "open_default", -- disbale netrw & use neo-tree for browsing
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false, --don't hide dot files
                    hide_gitignored = false, -- show files ignored by git
                },
            },
        })
    end        
}
