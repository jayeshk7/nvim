-- mason is just an installation tool for our LSPs. so you dont have to go and install each lsp separately. but this will put your lsp binaries in a place where practically only neovim can find them. so if you have other text editors you will have to install the lsp separately for them. 
-- you can skip this if you use lspconfig. installing lsp through your package manager is one of the best ways

return {
  "mason-org/mason.nvim",
  config = function ()
    require'mason'.setup({

    })
  end
}
