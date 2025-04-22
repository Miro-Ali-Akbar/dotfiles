return {
    'hat0uma/csvview.nvim',
    ft = {"csv"};
    cmd = { "CsvViewEnable" },
    config = function()
        require('csvview').setup()
    end
}
