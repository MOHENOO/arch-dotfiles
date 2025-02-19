return {
  {
    "catppuccin",
    optional = true,
    opts = {
      background = { -- :h background
        light = "frappe",
        dark = "macchiato",
      },
      -- color_overrides = {
      --   all = {
      --     base = "#000000",
      --   },
      -- },
      transparent_background = true,
    },
  },
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        vim.cmd("colorscheme catppuccin-macchiato")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd("colorscheme catppuccin-frappe")
      end,
    },
  },
}
