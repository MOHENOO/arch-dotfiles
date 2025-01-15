-- stylua: ignore
if true then return {} end

return {
  -- { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
    },
    config = true,
    opts = {
      integrations = {
        diffview = true,
        telescope = true,
      },
    },
  },
}
