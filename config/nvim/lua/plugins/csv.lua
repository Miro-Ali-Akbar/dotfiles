return {
  'hat0uma/csvview.nvim',
  cmd = { "CsvViewEnable" },
  config = function()
    require('csvview').setup()
  end
}
