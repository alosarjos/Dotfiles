return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      pre_save_cmds = { "Neotree action=close" },
      post_restore_cmds = { "Neotree action=show" },
    })

    vim.keymap.set("n", "<Leader>ls", require("auto-session.session-lens").search_session, {
      noremap = true,
    })
  end,
}
