return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  dependencies = {
    "williamboman/mason.nvim",
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup {
          automatic_installation = true,
        }
      end
    },
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    local lsp_zero = require("lsp-zero")
    local cmp = require('cmp')
    local cmp_format = require('lsp-zero').cmp_format()

    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    -- to learn how to use mason.nvim with lsp-zero
    -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {},
      handlers = {
        lsp_zero.default_setup,
      },
    })

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = "luasnip" },
        { name = "crates" },
        { name = "codeium" }
      },
      --- (Optional) Show source name in completion menu
      formatting = cmp_format,
    })
  end,
}
