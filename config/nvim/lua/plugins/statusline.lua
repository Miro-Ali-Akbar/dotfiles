return {
    lazy = false,
    "ojroques/nvim-hardline",
    config = function()
        local colors = {
            transparent = { gui = 'NONE', cterm = '16', cterm16 = '0' },
            grey_medium = { gui = '#1E1E2E', cterm = '17', cterm16 = '0' },
            grey_inactive = { gui = '#7E84A0', cterm = '61', cterm16 = '8' },
            grey_light = { gui = '#969DBC', cterm = '69', cterm16 = '7' },
            black = { gui = '#07070A', cterm = '16', cterm16 = '0' },
            white = { gui = '#AEB7D9', cterm = '189', cterm16 = '15' },
            red = { gui = '#F38BA8', cterm = '218', cterm16 = '9' },
            yellow = { gui = '#F9E2AF', cterm = '223', cterm16 = '11' },
        }
        local inactive = {
            guifg = colors.grey_inactive.gui,
            guibg = colors.transparent.gui,
            ctermfg = colors.grey_inactive.cterm,
            ctermbg = colors.transparent.cterm,
        }

        require("hardline").setup {
            theme = "custom",
            custom_theme = {
                text =  { gui = colors.grey_medium.gui, cterm = "NONE", cterm16 = "NONE" },

                normal = { gui = "#a6e3a1", cterm = "NONE", cterm16 = "NONE" },
                insert = { gui = "#fab387", cterm = "NONE", cterm16 = "NONE" },
                replace = { gui = "NONE", cterm = "NONE", cterm16 = "NONE" },
                inactive_comment = inactive,
                inactive_cursor = { gui = "NONE", cterm = "NONE", cterm16 = "NONE" },
                inactive_menu = inactive,
                visual = { gui = colors.red.gui, cterm = "NONE", cterm16 = "NONE" },
                command = { gui = "NONE", cterm = "NONE", cterm16 = "NONE" },
                alt_text = { gui = "NONE", cterm = "NONE", cterm16 = "NONE" },
                warning = colors.yellow,
            },
            bufferline = true,
            sections = {     -- define sections
                { class = 'mode', item = require('hardline.parts.git').get_item,     hide = 100 },
                { class = 'low',  item = require('hardline.parts.cwd').get_item,     hide = 100 },
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
