require("config.keybindings")
require("config.options")
require("config.lazy")
require("bufferline").setup{
  options = {
      mode = "buffers", -- set to "tabs" to only show tabpages instead
      style_preset = "minimal", -- or "default"
      themable = true,
      numbers = "none", -- can be "ordinal", "buffer_id", "both", or a function
      close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
      right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
      indicator = {
        icon = '▎', -- this should be omitted if indicator style is not 'icon'
        style = 'icon', -- can also be 'underline'|'none'
      },
      buffer_close_icon = '󰅖',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 30,
      max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
      truncate_names = true, -- whether or not tab names should be truncated
      tab_size = 21,
      diagnostics = "nvim_lsp", -- can be "nvim_lsp" | "coc" | false
      diagnostics_update_in_insert = false,
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      show_duplicate_prefix = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      separator_style = "slope", -- can be "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
      enforce_regular_tabs = false,
      always_show_bufferline = false,
      hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
      },
      sort_by = 'insert_after_current', -- can be 'insert_after_current' | 'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
  }
}
require('telescope').setup({
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
})
require'nvim-treesitter'.setup {
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require('plugins.mason')
