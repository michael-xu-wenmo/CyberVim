-- Configs --
require("config.lazy") -- setup package manager

--require("config.catppuccine") -- colorscheme
require("config.tokyonight") -- colorscheme

require("config.options") -- setup options
require("config.line_formating")

require("config.treesitter") -- treesitter

require("config.telescope") -- fuzzy finder
require("config.lsp") -- lsp
require("config.cmp") -- code completion
require("config.null-ls")
require("config.toggleterm")
require("config.git") -- git stuff
require("config.rust") -- rust stuff

-- Startup --
require("startup.startup") -- startup 

-- Remaps --
require("remaps.navigation")
require("remaps.telescope")
require("remaps.lsp")
require("remaps.toggleterm")
require('remaps.autorun')

