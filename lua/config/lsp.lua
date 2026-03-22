local lua_config = {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        preloadFileSize = 10000,
        library = {
          vim.env.VIMRUNTIME,
        }
      },
    },
  },
}

vim.lsp.config('lua_ls', lua_config)

local python_config = {
	settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "standard", -- "off", "basic", or "standard"
            },
        },
    },
    -- You can add an on_attach function here for keymaps, etc.
    on_attach = function(client, bufnr)
        -- Keymaps (example)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to definition' })
        -- ... other keymaps
    end,
}

vim.lsp.config('pylsp', python_config)
