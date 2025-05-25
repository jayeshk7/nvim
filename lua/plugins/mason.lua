-- mason is just an installation tool for our LSP. so you dont have to go and install each lsp separately.
-- but this will put your lsp binaries in a place where practically only neovim can find them. so if you have other text editors you will have to install the lsp separately for them. 
-- skip this if you're installing LS yourself and putting it on path. nvim-lspconfig is enough 

return {
  "mason-org/mason.nvim",
  config = function ()
    require'mason'.setup({})
  end
}
