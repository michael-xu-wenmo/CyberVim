--local mason_config = require("plugins.lsp")
--local on_attach = mason_config.on_attach
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
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

-- Python
local python_config = {
	on_attach = function(client, bufnr)
		if client.server_capabilities.semanticTokensProvider then
      		client.server_capabilities.semanticTokensProvider = {
        	full = true,
        	legend = client.server_capabilities.semanticTokensProvider.legend,
      		}
    	end
  	end,

	capabilities = capabilities,
	filetypes = {"python"},
	settings = {
    	basedpyright = {
      		analysis = {
        		autoSearchPaths = true,
        		useLibraryCodeForTypes = true,
        		typeCheckingMode = "standard", -- or "strict"	
    		},
      	},
    },
}

vim.lsp.config("basedpyright", python_config)
vim.lsp.enable("basedpyright")

local ruff_config = {
  capabilities = capabilities,
  init_options = {
    settings = {
      args = {}, -- you can customize later
    },
  },
}

local mypy_config = {
  capabilities = capabilities,
}

vim.lsp.config("ruff",ruff_config)
vim.lsp.config("mypy",mypy_config)

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Rust
local rust_config = {
	settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                command = "clippy", -- Use clippy for enhanced diagnostics
                allTargets = true,
            },
            inlayHints = {
                bindingModeHints = { enable = true },
                closureCaptureHints = { enable = true },
                closureReturnTypeHints = { enable = "always" },
            },
            -- Other settings can be added here
        }
	}
}

vim.lsp.config("rust-analyzer",rust_config)
