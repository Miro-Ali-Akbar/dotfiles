local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
        })
    end
vim.opt.rtp:prepend(lazypath)

require("config/settings")
require("config/keybinds")
require("config/scripts")

local plugin_specs = {
  { import = "plugins" },
}

if vim.env.NVIM_REPL == "1" then
  table.insert(plugin_specs, { import = "config/REPL" })
end

require("lazy").setup(plugin_specs)
