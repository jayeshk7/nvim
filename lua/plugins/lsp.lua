-- neovim needs a language server(LS) to which it can talk to.
-- the language server is generally some external process and the editor will communicate to it. neovim will spawn the lsp process and own it for its lifetime.
-- to avoid setting up lsp manually using vim.lsp.buf or whatever the apis are, i am using nvim-lspconfig plugin
-- :help lspconfig-all will tell give you the list of LS available and info on how to install them. easy way to install is through your package manager but i am using mason.nvim.

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only loads on lua files
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          }
        }
      }
    },

    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})
    end,
    -- if you have multiple error/warning on one line then this will open all of those in a popup. you can press <space>d again to go inside the float window and copy the exact error/warning. getting out of float window is <space>qq for me
    vim.keymap.set("n", "<space>d", vim.diagnostic.open_float),
    -- Put this early in your init.lua (after Neovim v0.11+ loads)
    vim.diagnostic.config({ virtual_text = true })
  }
}
