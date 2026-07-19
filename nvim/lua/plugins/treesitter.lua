return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- 基础解析器
    local parsers = {
      "bash", "c", "diff", "html", "lua", "luadoc",
      "markdown", "markdown_inline", "query", "vim", "vimdoc",
    }
    require("nvim-treesitter").install(parsers)

    -- FileType 事件自动安装和启用
    local available = require("nvim-treesitter").get_available()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local language = vim.treesitter.language.get_lang(args.match)
        if not language then return end

        local installed = require("nvim-treesitter").get_installed "parsers"
        local function try_attach(buf, lang)
          if not vim.treesitter.language.add(lang) then return end
          vim.treesitter.start(buf, lang)
        end

        if vim.tbl_contains(installed, language) then
          try_attach(args.buf, language)
        elseif vim.tbl_contains(available, language) then
          require("nvim-treesitter").install(language):await(function()
            try_attach(args.buf, language)
          end)
        else
          try_attach(args.buf, language)
        end
      end,
    })
  end,
}
