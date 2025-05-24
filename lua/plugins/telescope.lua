return {
    {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
    -- or                              , branch = '0.1.x',
	dependencies = {
	    'nvim-lua/plenary.nvim',
	    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	-- 2nd keymap is useful. <space>en is basically edit neovim. basically no matter which directory you're in, if you do <space>en then you will always telescope files of your neovim config. so if you want to change something in your config quickly then you can do <space>en
	config = function()
	    require('telescope').setup {
		pickers = {
		    find_files = {
			theme = "ivy"
		    },
		    help_tags = {
			theme = "ivy"
		    }
		},
		extensions = {
		    fzf = {}
		}
	    }

	    require('telescope').load_extension('fzf')

	    vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files)
	    vim.keymap.set("n", "<leader>fg", require('telescope.builtin').live_grep)
	    vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags)
	    vim.keymap.set("n", "<leader>en", function() 
		require('telescope.builtin').find_files {
		    cwd = vim.fn.stdpath("config")
		}
	    end)
	end
    }
}
