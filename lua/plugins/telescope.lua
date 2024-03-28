return {
   {
      'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
         local builtin = require("telescope.builtin")
         vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- fuzzy find files on ctrl-p
         vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- grep all files in project
      end
   },
   {
      'nvim-telescope/telescope-ui-select.nvim',
      config = function()
         require("telescope").setup({
            extensions = {
               ["ui-select"] = {
                  require("telescope.themes").get_dropdown {}
               }
            }
         })
         require("telescope").load_extension("ui-select")
      end
   },
}
