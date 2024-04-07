return {
	"mistricky/codesnap.nvim",
	build = "make",
	config = function()
		require("codesnap").setup({
			mac_window_bar = false,
			bg_color = "#535c68",
			watermark = "",
		})
	end,
}
