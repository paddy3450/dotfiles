vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'
	use 'morhetz/gruvbox'
	use 'junegunn/goyo.vim'

	use { 
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} } 
	}
end)
