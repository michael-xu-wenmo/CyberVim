require("crates").setup({
	completion = {
	}
})
require("cmp").setup.buffer({
	sources = {{name = "crates"}}
})
