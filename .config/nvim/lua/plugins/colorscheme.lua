-- stylua: ignore
-- if true then return {} end
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin",
    optional = true,
    opts = function ()
      -- local transparent = false
      -- if vim.g.neovide then
      --   transparent = true
      -- end
      return {
        flavour = "auto",
        background = { -- :h background
          light = "latte",
          dark = "frappe",
        },
        -- transparent_background = transparent,
      }
    end,
  },
}
