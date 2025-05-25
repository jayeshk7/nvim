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
      require('lspconfig').clangd.setup({})
      require('lspconfig').lua_ls.setup({})
      -- Put this early in your init.lua (after Neovim v0.11+ loads)
      vim.diagnostic.config({
        virtual_text = true,
      })
    end
  }
}
