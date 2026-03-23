vim.keymap.set("n", "<leader>t","<cmd>ToggleTerm<CR>",{noremap = true})

vim.keymap.set("n", "<leader>tr", function()
	local term = require("toggleterm.terminal").get(1)
	if term then
		term:shutdown()
	end
	vim.cmd("ToggleTerm", {noremap = true})
end, { desc = "Shutdown current terminal and open a new one" })
