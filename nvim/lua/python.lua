vim.api.nvim_create_autocmd("FileType", {
    -- This method is way way faster, easier and vim-like than LSP. Compiler file "python" isn't shipped by default, hence needs to be installed first.
    -- The % option can be added on either make command or in here, but I have added it here so make command can be used with other enviorments too. For example, make filename.c won't work.
	pattern = "python",
	callback = function()
		vim.cmd([[compiler python]])
		vim.cmd([[set makeprg=python3\ \%]])
		vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
	end,
})
