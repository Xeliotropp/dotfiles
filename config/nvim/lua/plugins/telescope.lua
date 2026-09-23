return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.0",
	dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "MunifTanjim/nui.nvim",
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
		local builtin = require("telescope.builtin")
    require("telescope").load_extension("ui-select")

		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git find files" })

    vim.keymap.set("n", "<leader>ps", function()
      local Input = require("nui.input")
      local event = require("nui.utils.autocmd").event

      local input = Input({
        position = "50%",
        size = { width = 40 },
        border = {
          style = "rounded",
          text = { top = " Search ", top_align = "center" },
        },
        win_options = {
          winhighlight = "Normal:Normal,FloatBorder:Normal",
        },
      }, {
        prompt = "> ",
        default_value = "",
        on_submit = function(value)
          builtin.grep_string({ search = value })
        end,
      })

      input:mount()

      input:on(event.BufLeave, function()
        input:unmount()
      end)
    end, { desc = "Telescope grep string (input box)" })

    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
  end
}
