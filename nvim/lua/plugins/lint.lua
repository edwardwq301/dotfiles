return {
  "mfussenegger/nvim-lint",
  enabled = false,
  opts = {
    linters_by_ft = {
      markdown = { "markdownlint" },
    },
  },
  config = function()
    local lint = require "lint"
    lint.linters_by_ft = lint.linters_by_ft or {}

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("lint", { clear = true }),
      callback = function()
        if vim.bo.modifiable then lint.try_lint() end
      end,
    })
  end,
}
