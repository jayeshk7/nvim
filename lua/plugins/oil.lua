return {
    {
	'stevearc/oil.nvim',
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	config = function()
	    require'oil'.setup {
		view_options = {
		    show_hidden = true,
		}
	    }
	    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc ='Opens oil at the current working file level' } )
	end
    }
}

-- REMEMBER you can use telescope while inside oil tree. it is useful to use both tgether

-- to navigate in the parent directory press '-'. 
-- to close the oil tree and go back to the file you were editing press CTRL-c

-- my problem with oil -- i am unable to do case insensitive search. it is little annoying please fix it
