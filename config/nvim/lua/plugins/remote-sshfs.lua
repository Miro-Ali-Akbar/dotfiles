return {
    'nosduco/remote-sshfs.nvim',
    cmd = { "RemoteSSHFSConnect" },
    config = function()
        require('remote-sshfs').setup({})
    end
}
