return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 100,
    config = function()
        require("catppuccin").setup({
            integrations = {
                cmp = true,
                fidget = true,
                gitsigns = true,
                illuminate = true,
                leap = true,
                mason = true,
                native_lsp = { enabled = true },
                nvimtree = true,
                rainbow_delimiters = true,
                snacks = { enabled = true },
                symbols_outline = true,
                fzf = true,
                treesitter = true,
                treesitter_context = true,
                which_key = true,
            },
            styles = {
                errors      = { "underline" },
                warnings    = { "underline" },
                hints       = { "underline" },
                information = { "underline" },
            },
        })
        vim.cmd.colorscheme "catppuccin"

        local spell_groups = { "SpellBad", "SpellCap", "SpellRare", "SpellLocal" }

        for _, group in ipairs(spell_groups) do
            vim.api.nvim_set_hl(0, group, {
                undercurl = false,
                underline = true,
            })
        end
    end
}
