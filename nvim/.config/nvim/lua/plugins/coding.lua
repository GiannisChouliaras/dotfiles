return {
    -- Create annotations with one keybind, and jump your cursor in the inserted annotation
    {
        "danymat/neogen",
        keys = {
            {
                "<leader>cc",
                function()
                    require("neogen").generate({})
                end,
                desc = "Neogen Comment",
            },
        },
        opts = { snippet_engine = "luasnip" },
        dependencies = {
            "L3MON4D3/LuaSnip", -- Add LuaSnip as a dependency
        },
    },

    -- Incremental rename
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        config = true,
    },

    -- Harpoon by ThePrimeagen
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Refactoring tool
    {
        "ThePrimeagen/refactoring.nvim",
        keys = {
            {
                "<leader>r",
                function()
                    require("refactoring").select_refactor()
                end,
                mode = "v",
                noremap = true,
                silent = true,
                expr = false,
            },
        },
        opts = {},
    },

    -- Go forward/backward with square brackets
    {
        "echasnovski/mini.bracketed",
        event = "BufReadPost",
        config = function()
            local bracketed = require("mini.bracketed")
            bracketed.setup({
                file = { suffix = "" },
                window = { suffix = "" },
                quickfix = { suffix = "" },
                yank = { suffix = "" },
                treesitter = { suffix = "n" },
            })
        end,
    },

    -- Better increase/descrease
    {
        "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
        config = function()
            local augend = require("dial.augend")
            require("dial.config").augends:register_group({
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias["%Y/%m/%d"],
                    augend.constant.alias.bool,
                    augend.semver.alias.semver,
                    augend.constant.new({ elements = { "let", "const" } }),
                },
            })
        end,
    },

    -- symbols outline
    {
        "simrat39/symbols-outline.nvim",
        keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
        cmd = "SymbolsOutline",
        opts = {
            position = "right",
        },
    },

    -- nvim cmp
    {
        "nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji" },
        opts = function(_, opts)
            table.insert(opts.sources, { name = "emoji" })
        end,
    },

    -- Adding Obsidian
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = true,
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Markdown
    {
        "MeanderingProgrammer/markdown.nvim",
        main = "render-markdown",
        opts = {},
        name = "render-markdown",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    },

    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
}
