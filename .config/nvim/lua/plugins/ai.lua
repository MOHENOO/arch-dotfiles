-- stylua: ignore
if true then return {} end

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  opts = {
    provider = "ollama",
    vendors = {
      ollama = {
        __inherited_from = "openai",
        api_key_name = "",
        endpoint = "http://192.168.100.110:11434/v1",
        -- model = "qwen2.5-coder:14b-instruct-q4_K_M",
        model = "mistral-nemo:12b-instruct-2407-q4_K_M",
        parse_response_data = function(data_stream, event_state, opts)
          require("avante.providers").copilot.parse_response(data_stream, event_state, opts)
        end,
        parse_curl_args = function(opts, code_opts)
          return {
            url = opts.endpoint .. "/chat/completions",
            headers = {
              ["Accept"] = "application/json",
              ["Content-Type"] = "application/json",
            },
            body = {
              model = opts.model,
              messages = require("avante.providers").copilot.parse_messages(code_opts),
              max_tokens = 2048,
              stream = true,
            },
          }
        end,
      },
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    -- "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
