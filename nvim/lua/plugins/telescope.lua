return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader><leader>",
        function()
          require("telescope.builtin").grep_string()
        end,
        desc = "grep under string",
      },
    },
    opts = {
      defaults = {
        path_display = {
          "smart",
        },
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
            ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
            ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
          },
        },
      },
    },
  },
}
