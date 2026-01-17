return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      blade = { "blade-formatter" },
      php = { "pint" },
    },
    formatters = {
      injected = { options = { ignore_errors = true } },

      ["blade-formatter"] = {
        command = "blade-formatter",
        args = {
          "--write",
          "$FILENAME",
          "--wrap-line-length",
          9999,
          "--wrap-attributes",
          "preserve-aligned",
        },
        stdin = false,
      },

      pint = {
        meta = {
          url = "https://github.com/laravel/pint",
          description =
          "Laravel Pint is an opinionated PHP code style fixer for minimalists. Pint is built on top of PHP-CS-Fixer and makes it simple to ensure that your code style stays clean and consistent.",
        },
        args = { "$FILENAME" },
        stdin = false,
      },
    },
  },

  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        blade = { "blade-formatter" }
      },
      format_on_save = {
        timeout_ms = 50,
        lsp_format = "fallback"
      },
      default_format_opts = {
        lsp_format = "fallback"
      },
    })
  end
}
