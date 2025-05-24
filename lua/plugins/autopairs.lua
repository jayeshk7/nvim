return {
    {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	-- this event option basically says, defer loading this plugin until user enters in insert mode
	config = true
	-- use opts = {} for passing setup options
	-- this is equivalent to setup({}) function
    }
}
