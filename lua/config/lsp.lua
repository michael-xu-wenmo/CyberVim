local mason_config = require("plugins.lsp")
local on_attach = mason_config.on_attach
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
local function get_python_path()

	local function exists(file)
   		local ok, err, code = os.rename(file, file)
   		if not ok then
      		if code == 13 then
         		return true
      		end
		end
		return ok, err
	end

  	if exists(".venv/") then
		return ".venv/bin/python3"
  	else
    	return "/usr/bin/python3"
  	end
end

local python_config = {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {"python"},
	before_init = function(_, config)
    	config.settings.python.pythonPath = get_python_path()
	end,
	settings = {
    	python = {
      		analysis = {
        		autoSearchPaths = true,
        		useLibraryCodeForTypes = true,
        		typeCheckingMode = "basic", -- or "strict"	
    		},
      	},
    },
}

vim.lsp.config("pyright", python_config)

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
