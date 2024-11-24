return {
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "stylua",
                "selene",
                "luacheck",
                "shellcheck",
                "shfmt",
                "css-lsp",
                "lemminx",
                "sqlls",
                "ruff",
                "gopls",
            })
        end,
    },

    -- lsp servers
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = true }, -- Enable inlay hints globally if needed
            servers = {
                gopls = {
                    enabled = true,
                    settings = {
                        gopls = {
                            hints = {
                                assignVariableTypes = false,
                                compositeLiteralFields = false,
                                compositeLiteralTypes = false,
                                constantValues = false,
                                functionTypeParameters = false,
                                parameterNames = false, -- Disable parameter name hints
                                parameterTypes = false, -- Disable parameter type hints
                                rangeVariableTypes = false,
                            },
                        },
                    },
                },
                ruff = {
                    enabled = true, -- Enable ruff integration
                    settings = {
                        ruff_lsp = {
                            fix_on_save = true, -- Automatically apply fixes on save
                            verbosity = "debug", -- Set verbosity level (e.g., "error", "warning", "info", "debug")
                            lint_on_save = true, -- Enable linting when saving files
                            args = { "--ignore-unused-arguments", "--line-length=100" }, -- Additional CLI arguments
                        },
                    },
                },
                lua_ls = {
                    enabled = true,
                    single_file_support = true,
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                workspaceWord = true,
                                callSnippet = "Both", -- Enable snippet completion for Lua
                            },
                            hint = {
                                enable = true,
                                paramType = false, -- Disable parameter type hints in Lua
                                paramName = "Disable", -- Disable parameter name hints
                            },
                            diagnostics = {
                                disable = { "trailing-space", "incomplete-signature-doc" },
                                severity = {
                                    strong = "Warning", -- Adjust severity of checks
                                    strict = "Hint", -- Lower the severity for strict checks
                                },
                            },
                            format = {
                                enable = true, -- Enable Lua auto-formatting
                                defaultConfig = {
                                    indent_style = "space",
                                    indent_size = "4",
                                    continuation_indent_size = "4",
                                },
                            },
                            type = {
                                castNumberToInteger = true, -- Handle number-to-integer casting in Lua
                            },
                        },
                    },
                },
            },
            setup = {},
        },
    },
}
