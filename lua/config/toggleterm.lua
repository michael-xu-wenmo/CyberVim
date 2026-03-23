require("toggleterm").setup({
  direction = "float",
  float_opts = {
    border = "rounded",
    width = function()
      return math.floor(vim.o.columns * 0.9)
    end,
    height = function()
      return math.floor(vim.o.lines * 0.8)
    end,
  },
  on_create= function(term)
    local venv_paths = {
      ".venv/bin/activate",
      "venv/bin/activate",
    }

    for _, path in ipairs(venv_paths) do
      if vim.fn.filereadable(path) == 1 then
        vim.fn.chansend(term.job_id, "source " .. path .. "\n")
        return
      end
    end
  end,
})
