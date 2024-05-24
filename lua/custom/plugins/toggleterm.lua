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

      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end
      --
      -- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
    end,
    -- config = true,
  },
}
