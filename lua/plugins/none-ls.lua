-- connects formatters, linters, and diagnostic tools to Neovim
-- install each tool with :Mason
-- see https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md for available builtins
return {
   "nvimtools/none-ls.nvim",
   config = function()
      local null_ls = require("null-ls") -- null-ls is deprecated. none-ls is a community-maintained fork. use null-ls config for backwards-compatibility
      null_ls.setup({
         sources = {
            -- lua
            null_ls.builtins.formatting.stylua,
            -- python
            null_ls.builtins.diagnostics.mypy,
            null_ls.builtins.diagnostics.pylint,
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.isort,
         }
      })

      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
   end
}
