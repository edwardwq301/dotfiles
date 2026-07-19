return {
  "stevearc/conform.nvim",
  enabled = false,
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local enabled_filetypes = {
        -- lua = true,
      }
      if enabled_filetypes[vim.bo[bufnr].filetype] then
        return { timeout_ms = 500 }
      end
      return nil
    end,
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      -- lua = { "stylua" },
      -- python = { "isort", "black" },
    },
  },
  keys = {
    { "<leader>f", function() require("conform").format { async = true } end, desc = "Format buffer" },
  },
}
