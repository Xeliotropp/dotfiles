-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    -- add your plugins here
    {
      "mason-org/mason.nvim",
      config = function()
        require("mason").setup()
      end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      lazy = false,
      config = function()
        require("catppuccin").setup({
          flavour = "macchiato", -- latte, frappe, macchiato, mocha
        })
      vim.cmd.colorscheme("catppuccin")
      end,
    },
    {
      'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
       dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
      'nvim-treesitter/nvim-treesitter',
      lazy = false,
      build = ':TSUpdate',
      config = function()
        require('nvim-treesitter').setup({  -- Changed this line
          ensure_installed = {
            "python",
            "javascript",
            "typescript",
            "php",
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "markdown",
            "markdown_inline",
          },
          highlight = {
            enable = true,
          },
          indent = {
            enable = true,
          },
        })
      end,
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        
        require("nvim-tree").setup({
          sort = {
            sorter = "case_sensitive",
          },
          view = {
            width = 30,
          },
          renderer = {
            group_empty = true,
          },
          filters = {
            dotfiles = true,
          },
        })
      end,
    },
    { "alexghergh/nvim-tmux-navigation" },
    {
      "adalessa/laravel.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-neotest/nvim-nio",
      },
      ft = { "php", "blade" },
      event = {
        "BufEnter composer.json",
      },
      cmd = { "Laravel" },
      keys = {
        { "<leader>ll", function() Laravel.pickers.laravel() end,              desc = "Laravel: Open Laravel Picker" },
        { "<c-g>",      function() Laravel.commands.run("view:finder") end,    desc = "Laravel: Open View Finder" },
        { "<leader>la", function() Laravel.pickers.artisan() end,              desc = "Laravel: Open Artisan Picker" },
        { "<leader>lt", function() Laravel.commands.run("actions") end,        desc = "Laravel: Open Actions Picker" },
        { "<leader>lr", function() Laravel.pickers.routes() end,               desc = "Laravel: Open Routes Picker" },
        { "<leader>lh", function() Laravel.run("artisan docs") end,            desc = "Laravel: Open Documentation" },
        { "<leader>lm", function() Laravel.pickers.make() end,                 desc = "Laravel: Open Make Picker" },
        { "<leader>lc", function() Laravel.pickers.commands() end,             desc = "Laravel: Open Commands Picker" },
        { "<leader>lo", function() Laravel.pickers.resources() end,            desc = "Laravel: Open Resources Picker" },
        { "<leader>lp", function() Laravel.commands.run("command_center") end, desc = "Laravel: Open Command Center" },
        {
          "gf",
          function()
            local ok, res = pcall(function()
              if Laravel.app("gf").cursorOnResource() then
                return "<cmd>lua Laravel.commands.run('gf')<cr>"
              end
            end)
            if not ok or not res then
              return "gf"
            end
            return res
          end,
          expr = true,
          noremap = true,
        },
      },
      opts = {
        features = {
          pickers = {
            provider = "snacks", -- "snacks | telescope | fzf-lua | ui-select"
          },
        },
      },
    },
    {
      "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
          "nvim-tree/nvim-web-devicons",
        },
    },

    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
    {
        'windwp/nvim-autopairs',
        config = function()
          require('nvim-autopairs').setup({})
        end
    },
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'L3MON4D3/LuaSnip',
      }
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Git find files' })
vim.keymap.set('n', '<leader>ps', function()
builtin.grep_string({search = vim.fn.input ("Search: > ")}) end)
vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })

