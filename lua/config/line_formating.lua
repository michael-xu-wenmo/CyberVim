-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tab stop is 4
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Customize the prefix symbol
        source = "always", -- Show virtual text always
        -- You can also format the message
        -- format = function(diagnostic)
        --   return diagnostic.message
        -- end,
    },
    signs = true, -- Show icons in the sign column (E, W, I, H)
    update_in_insert = false, -- Don't update diagnostics while in insert mode
    underline = true, -- Underline the problematic text
    severity_sort = true, -- Sort diagnostics by severity (errors first)
})

