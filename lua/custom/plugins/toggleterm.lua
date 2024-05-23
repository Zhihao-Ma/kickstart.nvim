return {
  -- https://github.com/akinsho/toggleterm.nvim
  {
    'akinsho/toggleterm.nvim',
    version = '*',

    config = function()
      -- terminal
      local new_terminal = function(direction)
        local Terminal = require('toggleterm.terminal').Terminal
        local term = Terminal:new {
          dir = './',
          direction = direction,
          auto_scroll = true,
        }
        return term
      end

      local hterm = new_terminal 'horizontal'
      local vterm = new_terminal 'vertical'
      local fterm = new_terminal 'float'

      function _hterm_toggle()
        hterm:toggle()
      end

      function _vterm_toggle()
        vterm:toggle()
      end

      function _fterm_toggle()
        fterm:toggle()
      end

      vim.keymap.set({ 'n', 't' }, '<A-h>', '<cmd>lua _hterm_toggle(hterm)<CR>', { desc = 'toggle terminal' })
      vim.keymap.set({ 'n', 't' }, '<A-v>', '<cmd>lua _vterm_toggle(vterm)<CR>', { desc = 'toggle terminal' })
      vim.keymap.set({ 'n', 't' }, '<A-i>', '<cmd>lua _fterm_toggle(fterm)<CR>', { desc = 'toggle terminal' })
    end,
    -- config = true,
  },
}
