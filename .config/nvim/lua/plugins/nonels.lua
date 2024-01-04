return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"saecki/crates.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		require("crates").setup({
			null_ls = {
				enabled = true,
				name = "crates.nvim",
			},
		})

		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.completion.spell,
				-- Rust
				null_ls.builtins.formatting.rustfmt,
			},
		})

		vim.keymap.set("n", "<C-I>", vim.lsp.buf.format, {})
	end,
}
