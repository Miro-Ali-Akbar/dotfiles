return {
    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "ribru17/blink-cmp-spell",
            "erooke/blink-cmp-latex",
        },
        ---@module "blink.cmp"
        ---@type blink.cmp.Config
        opts = {
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                ["<CR>"] = { "select_and_accept", "fallback" },
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
            },

            appearance = {
                -- "mono" (default) for "Nerd Font Mono" or "normal" for "Nerd Font"
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono"
            },

            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 0 },
                -- ghost_text = { enabled = true },
                list = { selection = { preselect = false, auto_insert = true } },
                accept = { auto_brackets = { enabled = true } },
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { "lazydev", "path", "lsp", "snippets", "spell", "buffer" },
                providers = {
                    path = {
                        max_items = 3,
                    },
                    buffer = {
                        -- keep case of first char
                        transform_items = function(a, items)
                            local keyword = a.get_keyword()
                            local correct, case
                            if keyword:match('^%l') then
                                correct = '^%u%l+$'
                                case = string.lower
                            elseif keyword:match('^%u') then
                                correct = '^%l+$'
                                case = string.upper
                            else
                                return items
                            end

                            -- avoid duplicates from the corrections
                            local seen = {}
                            local out = {}
                            for _, item in ipairs(items) do
                                local raw = item.insertText
                                if raw:match(correct) then
                                    local text = case(raw:sub(1, 1)) .. raw:sub(2)
                                    item.insertText = text
                                    item.label = text
                                end
                                if not seen[item.insertText] then
                                    seen[item.insertText] = true
                                    table.insert(out, item)
                                end
                            end
                            return out
                        end
                    },
                    spell = {
                        name = 'Spell',
                        module = 'blink-cmp-spell',
                        async = true,
                        opts = {
                            use_cmp_spell_sorting = true,
                            preselect_current_word = false,
                            max_entries = 5,
                            -- EXAMPLE: Only enable source in `@spell` captures, and disable it
                            -- in `@nospell` captures.
                            --
                            enable_in_context = function()
                                local curpos = vim.api.nvim_win_get_cursor(0)
                                local captures = vim.treesitter.get_captures_at_pos(
                                    0,
                                    curpos[1] - 1,
                                    curpos[2] - 1
                                )
                                local in_spell_capture = false
                                for _, cap in ipairs(captures) do
                                    if cap.capture == 'spell' then
                                        in_spell_capture = true
                                    elseif cap.capture == 'nospell' then
                                        return false
                                    end
                                end
                                return in_spell_capture
                            end,
                        },
                    },
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                }
            },
            fuzzy = { implementation = "lua" },
            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    },
    {
        'saghen/blink.pairs',
        event = "InsertEnter",
        version = '*', -- (recommended) only required with prebuilt binaries

        dependencies = { 'saghen/blink.download' },

        --- @module 'blink.pairs'
        --- @type blink.pairs.Config
        opts = {
            mappings = {
                enabled = true,
                pairs = {},
            },
            debug = false,
        }
    }
}
