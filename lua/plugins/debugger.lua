return {
   {
      "mfussenegger/nvim-dap",
      dependencies = {
         "rcarriga/nvim-dap-ui",
         -- debuggers can be found here:
         -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
         "mfussenegger/nvim-dap-python",
      },
      config = function()
         local dap, dapui = require("dap"), require("dapui")
         local os = require("os")

         dapui.setup()

         -- put DAPs for each language here
         require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

         dap.adapters.haskell = { -- must run 'stack install haskell-dap ghci-dap haskell-debug-adapter'
            type = "executable",
            command = "haskell-debug-adapter",
            args = {"--hackage-version=0.0.33.0"}
         }

         dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
               command = "js-debug-adapter", -- in PATH because of mason
               args = {"${port}"}
            }
         }
--[[
         dap.adapters.chrome = {
            type = "executable",
            command = "node",
            args = { os.getenv("HOME") .. "/.local/bin/vscode-chrome-debug/out/src/chromeDebug.js" }
         }
         dap.adapters.firefox = {
            type = "executable",
            command = "node",
            args = { os.getenv("HOME") .. "/.local/bin/vscode-firefox-debug/dist/adapter.bundle.js" }
         }
--]]

         dap.configurations.haskell = {
            type = "haskell",
            requiest = "launch",
            name = "Debug",
            workspace = "${workspaceFodler}",
            startup = "${file}",
            stopOnEntry = true,
            logFile = vim.fn.stdpath("data") .. "/haskell-dap.log",
            logLevel = "ERROR",
            ghciEnv = vim.empty_dict(),
            ghciPrompt = "λ: ",
            ghciInitialPrompt = "λ: ",
            ghciCmd= "stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show",
         }

         for _, language in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte" }) do
            dap.configurations[language] = {
               {
                  type = "pwa-node",
                  request = "launch",
                  name = "Launch with Node",
                  sourceMaps = true, 
                  program = "${file}",
                  cwd = "${workspaceFolder}",
                  skipFiles = {"<node_internals>/**"},
               },
               {
                  -- for typescript files. must run `tsc && node --inspect-brk dist/app.js`
                  type = "pwa-node",
                  request = "attach",
                  name = "Attach to existing `node --inspect-brk` process",
                  cwd = "${workspaceFolder}",
                  sourceMaps = true, -- Run .ts, .jsx, .tsx, etc.
                  skipFiles = {"<node_internals>/**"},
               },
               {
                  -- TODO: get this to work
                  type = "pwa-chrome",
                  request = "attach",
                  name = "Run in Chrome",
                  program = "${file}",
                  cwd = vim.fn.getcwd(),
                  sourceMaps = true,
                  protocol = "inspector",
                  port = 9222,
                  webRoot = "${workspaceFolder}"
               },
               {
                  -- TODO: get this to work
                  type = "firefox",
                  request = "launch",
                  name = "Run in Firefox",
                  reAttach = true,
                  url = "http://localhost:9223",
                  webRoot = "${workspaceFolder}",
                  firefoxExecutable = "/usr/bin/firefox"
               }
            }
         end

         dap.listeners.before.attach.dapui_config = dapui.open
         dap.listeners.before.launch.dapui_config = dapui.open
         dap.listeners.before.event_terminated.dapui_config = dapui.close
         dap.listeners.before.event_exited.dapui_config = dapui.close
         vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
         vim.keymap.set("n", "<Leader>dB", dap.set_breakpoint, {})
         vim.keymap.set("n", "<Leader>dc", dap.continue, {})
         vim.keymap.set("n", "<F5>", dap.continue, {})
         vim.keymap.set("n", "<F10>", dap.step_over, {})
         vim.keymap.set("n", "<F11>", dap.step_into, {})
         vim.keymap.set("n", "<F12>", dap.step_out, {})
      end,
   },
   {
      "rcarriga/nvim-dap-ui",
      dependencies = {
         "nvim-neotest/nvim-nio",
      },
   },
}
