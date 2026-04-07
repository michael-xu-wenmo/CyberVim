local function get_python()
  local candidates = {
    ".venv/bin/python",
    "venv/bin/python",
  }

  for _, path in ipairs(candidates) do
    if vim.fn.executable(path) == 1 then
      return path
    end
  end

  return "python3" -- fallback
end


vim.keymap.set("n", "<leader>r",
function()
	--python
	if vim.bo.filetype == "python" then
		vim.cmd("write")
	  	local file = vim.fn.expand("%:p")
	  	local python = get_python()

	  	local Terminal = require("toggleterm.terminal")
	  	local term = Terminal.get(1)

	  	if not term then
	  		vim.cmd("ToggleTerm") -- create it
	  	  	term = Terminal.get(1)
		end

	  	term:open()

	  	-- run
	  	local cmd =  python .. " " .. vim.fn.shellescape(file) .. "\n"
	  	vim.fn.chansend(term.job_id, cmd)

	elseif vim.bo.filetype == "rust" then
		vim.cmd("write")
		local Terminal = require("toggleterm.terminal")
		local term = Terminal.get(1)

		if not term then
			vim.cmd("ToggleTerm")
			term = Terminal.get(1)
		end

		term:open()

		local cmd = "cargo run\n"
		vim.fn.chansend(term.job_id, cmd)

	else
		print("Auto run not configured yet for filetype "..vim.bo.filetype)

	end -- end of the language check if statements

end, { desc = "Run file" })
