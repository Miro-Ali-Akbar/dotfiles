return {
    lazy = false,
    --    "nvim-lualine/lualine.nvim",
    -- "echasnovski/mini.statusline",
    -- config = function()
    --     require("mini.statusline").setup({
    --         set_vim_settings = true,
    --     })
    -- end,
    -- opts = {},
    "ojroques/nvim-hardline",
    config = function()
        require("hardline").setup {
            bufferline = true,
            sections = { -- define sections
                { class = 'mode', item = require('hardline.parts.git').get_item,     hide = 100 },
                { class = 'low', item = require('hardline.parts.cwd').get_item,     hide = 100 },
                { class = 'med',  item = require('hardline.parts.filename').get_item },
                '%<',
                { class = 'med',     item = '%=' },
                { class = 'low',     item = require('hardline.parts.wordcount').get_item, hide = 40 },
                { class = 'error',   item = require('hardline.parts.lsp').get_error },
                { class = 'warning', item = require('hardline.parts.lsp').get_warning },
                { class = 'warning', item = require('hardline.parts.whitespace').get_item },
                { class = 'high',    item = require('hardline.parts.filetype').get_item,  hide = 60 },
                { class = 'mode',    item = require('hardline.parts.line').get_item },
            },
        }
        vim.cmd("set cmdheight=0")
    end
}
