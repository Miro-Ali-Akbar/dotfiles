return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.install({ "c", "lua", "bash", "markdown", "markdown_inline", "typescript", "javascript", "jsdoc", "json", "python", "latex", "html", "css", "rust", "toml" })

    local function start(buf, lang)
      if pcall(vim.treesitter.start, buf, lang) then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end

    -- Highlight and indent every filetype, installing missing parsers on demand
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then return end
        if vim.tbl_contains(ts.get_installed("parser"), lang) then
          start(args.buf, lang)
        elseif vim.tbl_contains(ts.get_available(), lang) then
          ts.install(lang):await(vim.schedule_wrap(function()
            if vim.api.nvim_buf_is_valid(args.buf) then start(args.buf, lang) end
          end))
        end
      end,
    })
  end,
}
