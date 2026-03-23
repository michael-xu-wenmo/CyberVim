-- Quick save
vim.keymap.set('n', '<Leader>w', ':w<CR>', { noremap = true })

-- Move between windows with Ctrl + hjkl
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Auto center when jump
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true})
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true})

-- Restart --
-- vim.keymap.set("n", "<leader>uS", vim.cmd.restart, { desc = "Open mini starter" }) not implemented yet. Wait until 12

-- Terminal -- 
vim.keymap.set("t","<Esc>","<C-\\><C-n>",{noremap = true})
