vim.opt.incsearch = true
vim.g.mapleader = ","
vim.cmd([[syntax on]])
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.cmd([[colorscheme minimal]])
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.cmd([[filetype plugin indent on]])
vim.api.nvim_set_keymap("n", "<leader>w", ":write<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ss", ":setlocal spell!<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sn", "]s", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sp", "[s", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sa", "zg", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dt", function()
	vim.api.nvim_command("r !date +\\%Y-\\%m-\\%d")
end, { noremap = true }) 
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua<CR>")
vim.keymap.set("n", "<leader>r", ":make<CR>:copen", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("FileType", {
    -- This method is way way faster, easier and vim-like than LSP. Compiler file "python" isn't shipped by default, hence needs to be installed first.
    -- The % option can be added on either make command or in here, but I have added it here so make command can be used with other enviorments too.
	pattern = "python",
	callback = function()
		vim.cmd([[compiler python]])
		vim.cmd([[set makeprg=python3\ \%]])
		vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
	end,
})

-- LSP Related shortcuts
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", { silent = true })

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
	},
})
require("Comment").setup()
require("which-key").setup()
-- require("lspconfig").gopls.setup({})
-- require("lspconfig").tsserver.setup({})
require("lspconfig").pyright.setup({})
