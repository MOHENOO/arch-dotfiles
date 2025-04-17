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
  {"f-person/auto-dark-mode.nvim",
    opts = function ()
      local mode="dark"
      local handle = io.popen("date +%H")
      local result = tonumber(handle:read("*a"))
      handle:close()

      if result > 8 and result < 19 then
        mode="light"
      end

      return {
        set_dark_mode = function()
            vim.api.nvim_set_option_value("background", "dark", {})
        end,
        set_light_mode = function()
            vim.api.nvim_set_option_value("background", "light", {})
        end,
        update_interval = 3000,
        fallback = mode
      }
    end,
  },
}
