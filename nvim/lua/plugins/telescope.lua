return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      --  {
      --    "<c-k",
      --    function()
      --      require("telescope.actions").preview_scrolling_up(0)
      --    end,
      --    desc = "socrolling up preview",
      --  },
      --  {
      --    "<c-j",
      --    function()
      --      require("telescope.actions").preview_scrolling_down(0)
      --    end,
      --    desc = "socrolling down preview",
      --  },
      --{
      --  "<c-h",
      --  function()
      --    require("telescope.actions").preview_scrolling_left(0)
      --  end,
      --  mode = "i",
      --  desc = "socrolling left preview",
      --},
      --  {
      --    "<c-l",
      --    function()
      --      require("telescope.actions").preview_scrolling_right(0)
      --    end,
      --    desc = "socrolling right preview",
      --  },
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
      },
    },
  },
}
