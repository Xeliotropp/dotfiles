return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.2.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim"

  },
  config = function()
    require("telescope").setup({
      pickers = {
        buffers = {
          show_all_buffers = true,
          sort_mru = true,
          mappings = {
            i = {
              ["<c-d>"] = "delete_buffer",
            },
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({
          }),
        },
      },
    })
  end
}
