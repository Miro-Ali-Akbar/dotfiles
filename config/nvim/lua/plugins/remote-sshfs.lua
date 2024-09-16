return {
    'nosduco/remote-sshfs.nvim',
    cmd = { "RemoteSSHFSConnect" },
    dependencies = { 'nvim-telescope/telescope.nvim' },   -- optional if you declare plugin somewhere else
    config = function()
        require('remote-sshfs').setup({})
    end
}
