return {
    lazy  = false,
--    "nvim-lualine/lualine.nvim",
    -- "echasnovski/mini.statusline",
    -- config = function()
    --     require("mini.statusline").setup({
    --         set_vim_settings = true,
    --     })
    -- end,
    -- opts = {},
    "ojroques/nvim-hardline",
    config = function ()
        require('hardline').setup {
            bufferline = true,
        }
        vim.cmd("set cmdheight=0")
    end
}
