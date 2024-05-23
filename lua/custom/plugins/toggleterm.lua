return {
  -- https://github.com/akinsho/toggleterm.nvim
  {
    'akinsho/toggleterm.nvim',
    version = '*',

    config = function()
      local get_size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end
      require('toggleterm').setup {
        size = 20 | get_size,
      }
      return true
    end,
    -- config = true,
  },
}
