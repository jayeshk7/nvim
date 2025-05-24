-- lua/plugins/mini.lua

return {
  {
    'echasnovski/mini.nvim',
    -- enable = false,
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }
    end
  }
}
