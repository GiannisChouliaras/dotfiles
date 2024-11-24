return {
    "mfussenegger/nvim-dap-python",
    dependencies = {
        "rcarriga/nvim-dap-ui", -- Adding dap-ui
        "nvim-neotest/nvim-nio", -- Required by dap-ui
    },
    -- stylua: ignore
 keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
        { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
        { "<leader>db", function() require('dap').toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        { "<leader>dc", function() require('dap').continue() end, desc = "Continue" },
        { "<leader>ds", function() require('dap').step_into() end, desc = "Step Into" },
        { "<leader>do", function() require('dap').step_over() end, desc = "Step Over" },
        { "<leader>du", function() require('dap').step_out() end, desc = "Step Out" },
        { "<leader>dp", function() require('dap').pause() end, desc = "Pause" },
        { "<leader>dt", function() require('dap').terminate() end, desc = "Terminate" },
        { "<leader>dC", function() require('dapui').close() end, desc = "Close DAP UI" },  -- Close DAP UI
        { "<leader>dR", function() require('dap').repl.toggle() end, desc = "Toggle REPL" },  -- Toggle REPL
        
        -- Additional Key Mappings
        { "<leader>dt", function() require('dapui').toggle() end, desc = "Toggle DAP UI" },  -- Toggle DAP UI
        { "<leader>dRt", function() require('dap').restart() end, desc = "Restart Debug Session" },  -- Restart Debugging Session
        { "<leader>dx", function() require('dap').reverse_step_into() end, desc = "Step Backward" },  -- Step Backwards
        { "<leader>dr", function() require('dap').run_to_cursor() end, desc = "Run to Cursor" },  -- Run to Cursor
        { "<leader>dL", function() require('dap').set_log_point(vim.fn.input('Message: ')) end, desc = "Set Log Point" },  -- Set Log Point
        { "<leader>dbc", function() require('dap').toggle_breakpoint(nil, nil, vim.fn.input('Condition: ')) end, desc = "Toggle Conditional Breakpoint" },  -- Toggle Conditional Breakpoint
    },
    config = function()
        -- Use the absolute path to your virtual environment's Python
        local venv_python_path = "/home/ioannis-chouliaras/.virtualenvs/debugpy/bin/python"

        -- Check if the virtual environment's Python executable exists
        if vim.fn.filereadable(venv_python_path) == 1 then
            require("dap-python").setup(venv_python_path)
        else
            vim.notify("Python virtual environment for debugpy not found at " .. venv_python_path, vim.log.levels.WARN)
        end

        -- Setting up dap-ui
        local dap, dapui = require("dap"), require("dapui")

        -- Configure dap-ui
        dapui.setup()

        -- Open dap-ui when a debugging session starts
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end

        -- Keep dap-ui open if the debug session is still active
        dap.listeners.before.event_terminated["dapui_config"] = function()
            -- Check if the session has fully terminated
            if dap.session() == nil then
                dapui.close()
            end
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
            -- Ensure dap-ui closes after the session exits
            if dap.session() == nil then
                dapui.close()
            end
        end
    end,
}
