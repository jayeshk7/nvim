-- so lsp basically needs a language server to which our client (nvim) can talk to. so to find the language servers we are installing lspconfig - this gives us how to get thetlangauge servers for all the popular programming languages. after installing this run :help lspconfig-all then search of the programming languages' language server you want to install. you will find how to install the language server. easy way is to install using your package manager.
-- the language server is generally some external process like some binary and the editor will communicate to it. the editor will generally spawn the lsp process and own that process for its lifetime.

return {
  {
	"neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",     -- only loads on lua files
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
      virtual_text = false,
      virtual_lines = true,
      signs        = true,      -- keep showing signs in the gutter
      underline    = true,      -- underline error spans
      update_in_insert = false, -- don’t refresh diagnostics while typing
    })
    end
  }
}


