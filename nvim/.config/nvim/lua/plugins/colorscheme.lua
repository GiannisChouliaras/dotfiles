return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    background = { dark = "mocha" },
    opts = {
        transparent_background = true,
    },
}
-- return {
--     "ellisonleao/gruvbox.nvim",
--     name = "gruvbox",
--     lazy = false,
--     priority = 1000,
--     opts = {
--         terminal_colors = true,
--         transparent_mode = true,
--         bold = false,
--         italic = {
--             strings = false,
--             comments = true,
--         },
--         palette_overrides = {
--             bg = "#1b1d1e", -- Keeping the dark background for a neutral base
--             fg = "#bfa05d", -- A softer golden yellow, less vibrant and easier on the eyes
--
--             black = "#1b1d1e", -- Same as background
--             bright_black = "#2c2c2c", -- Slightly faded black for contrast
--
--             red = "#c97b6a", -- Muted red, inspired by Goku's gi but softer
--             bright_red = "#d4948b", -- A smoother, less striking red for highlights
--
--             green = "#6c8973", -- Faded Namekian green, easy on the eyes
--             bright_green = "#8ea393", -- Subtler bright green for accents
--
--             yellow = "#e8c86b", -- Faded golden yellow for a softer energy effect
--             bright_yellow = "#f1d08f", -- A smooth golden hue, less harsh
--
--             blue = "#6a7c9b", -- Soft blue inspired by Vegeta's armor but toned down
--             bright_blue = "#8aa1c4", -- A faded sky blue for accents
--
--             purple = "#8b7a9d", -- Soft purple, inspired by Whis but subtle
--             bright_purple = "#a496b3", -- Faded light purple for highlighting
--
--             aqua = "#6a9b9b", -- Teal shade, faded for a calmer energy blast
--             bright_aqua = "#8fbcbc", -- Soft aqua, smoother for visual comfort
--
--             white = "#bfbfbf", -- Neutral off-white
--             bright_white = "#d9d9d9", -- Brighter off-white, but still gentle
--         },
--         inverse = false,
--         dim_inactive = false,
--         contrast = "hard",
--     },
-- }

-- return {
--     "folke/tokyonight.nvim",
--     name = "tokyonight",
--     lazy = false,
--     priority = 1000,
--     opts = {
--         style = "moon",
--         transparent = true,
--         terminal_colors = true,
--         styles = {
--             comments = { italic = true },
--             keywords = { italic = true },
--             functions = { bold = false },
--             variables = {},
--             sidebars = "transparent",
--             floats = "transparent",
--         },
--     },
-- }
-- return {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     dark_variant = "moon",
--     dim_inactive_windows = true,
--     extend_background_behind_borders = true,
--     opts = {
--         enable = {
--             terminal = true,
--             legacy_highlights = true,
--             migrations = true,
--         },
--         styles = {
--             bold = false,
--             italic = false,
--             transparency = false,
--         },
--         highlight_groups = {
--             ["@string"] = { fg = "#837356" },
--             ["@keyword"] = { fg = "#41604b" },
--             ["@variable"] = { fg = "#7b8572" },
--             ["@type"] = { fg = "#755a36" },
--             ["@type.builtin"] = { fg = "#755a36" },
--             ["@type.definition"] = { fg = "#755f34" },
--             ["@operator"] = { fg = "#b7b4b4" },
--             ["@keyword.operator"] = { fg = "#9e6969" },
--             ["@keyword.import"] = { fg = "#41604b" },
--             ["@keyword.repeat"] = { fg = "#41604b" },
--             ["@keyword.return"] = { fg = "#41604b" },
--             ["@keyword.exception"] = { fg = "#41604b" },
--             ["@comment"] = { fg = "#40403f" },
--             ["@keyword.conditional"] = { fg = "#41604b" },
--             ["@keyword.conditional.ternary"] = { fg = "#41604b" },
--         },
--     },
-- }
-- return {
--     {
--         "craftzdog/solarized-osaka.nvim",
--         lazy = true,
--         priority = 1000,
--         opts = function()
--             return {
--                 transparent = true,
--                 styles = {
--                     bold = false,
--                     comments = { italic = true },
--                     keywords = { italic = true },
--                     floats = "transparent",
--                     sidebars = "transparent",
--                 },
--                 hide_inactive_statusline = true,
--             }
--         end,
--     },
-- }
