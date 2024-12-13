return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")

        -- Example configuration for Python debugging
        dap.adapters.python = {
            type = "executable",
            command = "python",
            args = { "-m", "debugpy.adapter" },
        }
        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                pythonPath = function()
                    return "/usr/bin/python"
                end,
            },
        }
    end,
}
