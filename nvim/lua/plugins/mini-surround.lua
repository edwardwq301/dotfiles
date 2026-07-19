return {
  "nvim-mini/mini.nvim",
  config = function()
    -- saiw)  - Surround Add Inner Word )Paren
    -- sd'    - Surround Delete 'quote
    -- sr)'   - Surround Replace ) with '
    require("mini.surround").setup()
  end,
}
