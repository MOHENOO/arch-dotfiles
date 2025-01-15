return {
  { "direnv/direnv.vim", lazy = false },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- inlay_hints = {
      --   enabled = true,
      -- },
      codelens = {
        enabled = true,
      },
    },
  },
}
