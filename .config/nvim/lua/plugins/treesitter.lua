return {
  {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function ()
      require("nvim-treesitter.configs").setup({
      })
    end
  }
}
