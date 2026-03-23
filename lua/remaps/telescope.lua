local builtin = require('telescope.builtin')
local actions = require("telescope.actions")

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fc', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set("n", "<space>fb", function()
	require("telescope").extensions.file_browser.file_browser()
end)

require('telescope').setup{
  defaults = {
    mappings = {
      n = {
		-- Remap vertical split to <C-v> (default)
		["o"] = actions.select_vertical,
        -- Remap horizontal split to <C-h> instead of <C-x>
        ["p"] = actions.select_horizontal,
		["<CR>"] = actions.select_tab,
      },
	  i = {
		  ["<CR>"] = actions.select_tab
	  }
    },
  }
}

