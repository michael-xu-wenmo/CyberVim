local vscode_colors = {
    blue       = "#4FC1FF", -- Variables, Parameters
    light_blue = "#9CDCFE", -- Fields, Properties
    green      = "#6A9955", -- Comments
    yellow     = "#DCDCAA", -- Functions, Methods
    orange     = "#CE9178", -- Strings
    teal       = "#4EC9B0", -- Classes, Types, Interfaces
    pink       = "#C586C0", -- Keywords, Control flow
    gold       = "#D7BA7D", -- Constants, Enums
    silver     = "#D4D4D4", -- Plain text / Default
}

vim.cmd("syntax on")

require("tokyonight").setup({
  style = "storm", -- or "night"
  on_highlights = function(hl)
    -- Force semantic tokens to use specific colors if they feel dull
    hl["@lsp.type.variable"] = { fg = vscode_colors.light_blue }      -- Variables (usually white/off-white)
    hl["@lsp.type.selfParameter.python"] = { fg = vscode_colors.light_blue }      -- selfParameter
	hl["@lsp.type.property.python"] = { fg = vscode_colors.light_blue }

    hl["@lsp.type.method"] = { fg = vscode_colors.yellow }       -- Methods
    hl["@lsp.type.function"] = { fg = vscode_colors.yellow }     -- Functions

    hl["@lsp.type.class"] = { fg = vscode_colors.teal}      -- Classes/Types
    hl["@lsp.type.type"] = { fg = vscode_colors.teal}      -- Classes/Types
    hl["@lsp.type.namespace.python"] = { fg = vscode_colors.teal}      -- Classes/Types

	hl["pythonInclude"] = { fg = vscode_colors.pink}
  end,
})

vim.cmd[[colorscheme tokyonight-storm]]
