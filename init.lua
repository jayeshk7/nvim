--require is for importing diff files. so we are importing this file. you might think you just have to create config.lazy but no, dot (.) means folder here. you might think you have to create a config/lazy file but no. neovim only looks for lua files in require() inside of folders that have 'lua' as their toplevel folder. and these folders should be in the runtime path. :echo nvim_list_runtime_path() will show you the runtime paths. it's usually should have .config/nvim so you can just create alongside the init.lua file
require("config.lazy")

-- changing some vim.opt table fields
local set = vim.opt

set.shiftwidth = 2
set.tabstop = 2
set.smartindent = true
set.expandtab = true


set.number = true
set.relativenumber = true
set.clipboard = "unnamedplus"

-- if both ignorecase & smartcase are true that means - if there's any uppercase in search string then do exact case matching otherwise ignore case. incsearch means incremental search, it shows matches as you type incrementally. 
set.ignorecase = true
set.smartcase = true
set.hlsearch = false
set.incsearch = true

-- first keymap is for sourcing of file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("i", "<C-H>", "<C-W>", {silent = true, desc = 'delete from cursor to ending word'})
vim.keymap.set("n", "j", "gj", { desc = 'move properly in wrapped lines '})
vim.keymap.set("n", "k", "gk", { desc = 'move properly in wrapped lines '})
vim.keymap.set("n", "<space>ww", "<CMD>w<CR>", { desc = 'saves file' })
vim.keymap.set("n", "<space>qq", "<CMD>q<CR>", { desc = 'quits without saving file' })
vim.keymap.set("n", "<space>wq", "<CMD>wq<CR>", { desc = 'quits without saving file' })

-- so vim is a table. then we are accessing the api field in the vim table, then we are going to access the nvim_create_autocmd field in api. if you did :lua =vim -- you will see its a very big vim table. you can also do :lua =vim.api or vim.api.nvim_create_autocmd
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', {clear=true}),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- do :help wincmd to refer any window/tab navigation
-- one useful one - if you have many split tabs in your window you can do CTRL-W T. this will make all the split tabs their full own tabs and you can rotate between them using gt.

-- using the neovim terminal is very useful as well. if you have tmux or something going on then it's fine to skip. <space>st is for show terminal
vim.keymap.set("n", "<space>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0,14)
end)

-- remaining things
-- 1. advanced telescope
-- 2. quickfix
