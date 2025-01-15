local handle = io.popen("hostname")
local hostname = handle:read("*a")
handle:close()

hostname = hostname:gsub("\n", "")
local home = os.getenv("HOME")

return {
  require("lspconfig").nixd.setup({
    settings = {
      nixd = {
        nixpkgs = {
          expr = "import <nixpkgs> { }",
        },
        formatting = {
          command = { "alejandra" },
        },
        options = {
          home_manager = {
            expr = string.format(
              '(builtins.getFlake "%s/Github/nix-config").homeConfigurations."mohenoo@%s".options',
              home,
              hostname
            ),
          },
          nix_darwin = {
            expr = string.format(
              '(builtins.getFlake "%s/Github/nix-config").darwinConfigurations.%s.options',
              home,
              hostname
            ),
          },
          nixos = {
            expr = string.format(
              '(builtins.getFlake "%s/Github/nix-config").nixosConfigurations.%s.options',
              home,
              hostname
            ),
          },
        },
      },
    },
  }),
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "nix" })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        nix = { "alejandra" },
      },
    },
  },
}
