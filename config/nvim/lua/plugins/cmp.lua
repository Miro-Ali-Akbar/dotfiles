return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "ribru17/blink-cmp-spell",
      "erooke/blink-cmp-latex",
      "alexandre-abrioux/blink-cmp-npm.nvim",
    },
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        ["<CR>"] = { "accept", "fallback" },
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
        default = { "npm", "latex", "lazydev", "path", "lsp", "snippets", "spell", "buffer" },
        providers = {
          npm = {
            name = "npm",
            module = "blink-cmp-npm",
            async = true,
            -- optional - make blink-cmp-npm completions top priority (see `:h blink.cmp`)
            score_offset = 100,
            -- optional - blink-cmp-npm config
            ---@module "blink-cmp-npm"
            ---@type blink-cmp-npm.Options
            opts = {
              ignore = {},
              only_semantic_versions = true,
              only_latest_version = false,
            }
          },
          latex = {
            name = "Latex",
            module = "blink-cmp-latex",
            opts = {
              -- set to true to insert the latex command instead of the symbol
              insert_command = true
            },
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
          path = {
            max_items = 3,
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
