local packer = require('packer')
return packer.startup({
	config = {
		opt_default = false,
		display = {open_cmd = 'tabedit', keybindings = {prompt_revert = 'R', diff = 'D'}},
		git = {
			default_url_format = 'https://github.com.cnpmjs.org/%s'
		}
	},
	function()
		-- Packer can manage itself
		use {'wbthomason/packer.nvim'}

		-- comment
		use {'tomtom/tcomment_vim'}

		-- autopair
		use {'Raimondi/delimitMate', event = 'InsertEnter',opt = true }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

		-- imporve f action
		use {'rhysd/clever-f.vim'}

		-- asyncSeries
		
		use {'skywind3000/vim-terminal-help'}
		use {'skywind3000/asynctasks.vim'}
		use {'skywind3000/asyncrun.vim'}

		-- themes
		use {'sainnhe/edge'}
		use {'sainnhe/everforest'}

		-- show color
		-- use {'equalsraf/neovim-gui-shim'}

		-- statusline
		use	{'glepnir/galaxyline.nvim', branch = 'main', config = function() require 'eviline' end}
		use {'kyazdani42/nvim-web-devicons'}

		--coc
		use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}

		--vista.vim symbol navigation
		use {'tweekmonster/startuptime.vim', cmd = 'StartupTime',opt=true}
		-- fuzzy file finder
		use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'} 

		-- change surrounding symbol
		use {'machakann/vim-sandwich'}

		-- replace
		use {'brooth/far.vim'}

		-- char search
		use {'kevinhwang91/nvim-hlslens'}

		-- file-tree
		use {'kevinhwang91/rnvimr',opt = false}

		-- auto-save {	
		use {'Pocco81/AutoSave.nvim'}

		--git
		use {'tpope/vim-fugitive'}
		use {'rbong/vim-flog'}

		--quickfix
		use {'kevinhwang91/nvim-bqf'}

		--scroll
		-- use {'karb94/neoscroll.nvim'}

	end
})
