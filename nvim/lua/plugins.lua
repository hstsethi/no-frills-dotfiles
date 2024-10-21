local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	spec = {
		"neovim/nvim-lspconfig",
		"folke/which-key.nvim",
		"numtoStr/comment.nvim",
		"ibhagwan/fzf-lua", -- Telebloat not required
        "tpope/vim-fugitive",
	},
})
require("Comment").setup()
require("which-key").setup()
-- require("lspconfig").gopls.setup({})
-- require("lspconfig").tsserver.setup({})
require("lspconfig").pyright.setup({})
