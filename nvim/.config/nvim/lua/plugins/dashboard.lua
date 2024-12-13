return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    opts = function()
        local dashboard = require("alpha.themes.dashboard")

        -- Sleek futuristic logo
        local logo = [[
       _                 _   _       
   ___| |__   ___  _   _| | (_) ___  
  / __| '_ \ / _ \| | | | | | |/ _ \ 
 | (__| | | | (_) | |_| | |_| | (_) |
  \___|_| |_|\___/ \__,_|_(_)_|\___/ 
        ]]

        dashboard.section.header.val = vim.split(logo, "\n")

        -- Minimal yet futuristic buttons
        dashboard.section.buttons.val = {
            dashboard.button("f", "󰍉  Find File", "<cmd>Telescope find_files<cr>"),
            dashboard.button("e", "󰈔  New File", "<cmd>ene <BAR> startinsert<cr>"),
            dashboard.button("r", "󰄉  Recent", "<cmd>Telescope oldfiles<cr>"),
            dashboard.button("g", "󰱼  Find Text", "<cmd>Telescope live_grep<cr>"),
            dashboard.button("c", "󰅒  Config", "<cmd>e $MYVIMRC<cr>"),
            dashboard.button("s", "󰑓  Restore Session", "<cmd>lua require('persistence').load()<cr>"),
            dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<cr>"),
            dashboard.button("q", "󰩈  Quit", "<cmd>qa<cr>"),
        }

        -- Apply Catppuccin highlights
        vim.cmd.colorscheme("catppuccin")
        dashboard.section.header.opts.hl = "CatppuccinGreen"
        dashboard.section.buttons.opts.hl = "CatppuccinBlue"
        dashboard.section.footer.opts.hl = "CatppuccinOrange"

        -- Footer: Futuristic stats
        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = "⚡ Neovim Future: "
                    .. stats.loaded
                    .. "/"
                    .. stats.count
                    .. " plugins in "
                    .. ms
                    .. "ms | Productivity Unlocked 🚀"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })

        return dashboard
    end,
    config = function(_, dashboard)
        -- Close Lazy when dashboard initializes
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                once = true,
                pattern = "AlphaReady",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        require("alpha").setup(dashboard.opts)
    end,
}
