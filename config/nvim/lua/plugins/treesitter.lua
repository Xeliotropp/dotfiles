return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "html",
      "css",
      "typescript",
      "javascript",
      "lua",
      "vim",
      "vimdoc"
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
  end,
}
