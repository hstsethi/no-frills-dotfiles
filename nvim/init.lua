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
vim.api.nvim_set_keymap("i", "jjj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dt", function()
	vim.api.nvim_command("r !date +\\%Y-\\%m-\\%d")
end, { noremap = true }) 
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua<CR>")
vim.keymap.set("n", "<leader>r", ":make<CR>:cwopen", { noremap = true, silent = true }) -- cwopen option only opens qf window if there are errors.
require("plguins")
require("python")
require("lsp")
