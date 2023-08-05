-- raw
require('colorizer').setup()
require('fFHighlight').setup()
require('hlslens').setup()

-- config patch
require('config.treesitter')
require('config.nightfox')
--require('config.gitsigns')
require('config')
require('config.session-manager')
require('config.ufo')
require('config.bqf')
require('config.ufo')
require("harpoon").setup({
    menu = {
        width = 120,
    }
})
require("flash").setup()
require('Comment').setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
require('nvim-highlight-colors').setup {}


--require("bufferline").setup{}
--require('config.feline')
--require('stl')

--vim.g.doom_one_cursor_coloring = false
---- Set :terminal colors
--vim.g.doom_one_terminal_colors = true
---- Enable italic comments
--vim.g.doom_one_italic_comments = false
---- Enable TS support
--vim.g.doom_one_enable_treesitter = true
---- Color whole diagnostic text or only underline
--vim.g.doom_one_diagnostics_text_color = false
---- Enable transparent background
--vim.g.doom_one_transparent_background = false

---- Pumblend transparency
--vim.g.doom_one_pumblend_enable = false
--vim.g.doom_one_pumblend_transparency = 20

---- Plugins integration
--vim.g.doom_one_plugin_neorg = true
--vim.g.doom_one_plugin_barbar = false
--vim.g.doom_one_plugin_telescope = false
--vim.g.doom_one_plugin_neogit = true
--vim.g.doom_one_plugin_nvim_tree = true
--vim.g.doom_one_plugin_dashboard = true
--vim.g.doom_one_plugin_startify = true
--vim.g.doom_one_plugin_whichkey = true
--vim.g.doom_one_plugin_indent_blankline = true
--vim.g.doom_one_plugin_vim_illuminate = true
--vim.g.doom_one_plugin_lspsaga = false

--vim.cmd("colorscheme doom-one")
