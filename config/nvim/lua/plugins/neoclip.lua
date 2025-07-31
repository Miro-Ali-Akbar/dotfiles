return {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
        -- you'll need at least one of these
        { 'nvim-telescope/telescope.nvim' },
        -- {'ibhagwan/fzf-lua'},
    },
    config = function()
        local function is_whitespace(line)
            return vim.fn.match(line, [[^\s*$]]) ~= -1
        end

        local function all(tbl, check)
            for _, entry in ipairs(tbl) do
                if not check(entry) then
                    return false
                end
            end
            return true
        end

        require('neoclip').setup({
            default_register = '+',
            on_select = {
                move_to_front = true,
            },
            filter = function(data)
                return not all(data.event.regcontents, is_whitespace)
            end,
        })
        vim.keymap.set("n", "<leader>v", "<cmd>Telescope neoclip<cr>", { desc = "Neoclip" })
        -- TODO: Snacks
    end,
}
