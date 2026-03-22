-- Configs --
require("config.lazy") -- setup package manager
require("config.options") -- setup options
require("config.line_formating")
require("config.catppuccine") -- colorscheme
require("config.telescope") -- fuzzy finder
require("config.treesitter") -- treesitter
require("config.lsp") -- lsp

-- Startup --
require("startup.startup") -- startup 

-- Remaps --
require("remaps.navigation")
require("remaps.telescope")
require("remaps.lsp")
