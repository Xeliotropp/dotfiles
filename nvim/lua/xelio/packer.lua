-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}
  
  use ({'nvim-treesitter/nvim-treesitter'}, {run= ':TSUpdate'})
  use ({'nvim-treesitter/playground'})
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end
  }
  use {
    "windwp/nvim-ts-autotag"
  }
  -- Laravel support
  use {
    "adalessa/laravel.nvim",
    requires = {
      "tpope/vim-dotenv",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "kevinhwang91/promise-async",
    }
  }
  use {"williamboman/mason.nvim"}
  use {
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
  }
}
use "stevearc/conform.nvim"
use {
  'christoomey/vim-tmux-navigator',
  config = function()
    -- Disable tmux navigator when zooming the Vim pane
    vim.g.tmux_navigator_disable_when_zoomed = 1
    
    -- Save on switch (optional)
    vim.g.tmux_navigator_save_on_switch = 2
    
    -- Preserve zoom (optional)
    vim.g.tmux_navigator_preserve_zoom = 1
  end
}
end)
