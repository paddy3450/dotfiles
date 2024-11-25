return {
	'navarasu/onedark.nvim', -- Theme inspired by Atom
		config = function()
			vim.cmd [[colorscheme onedark]]
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
}
