return {

  {
    "nvim-cmp",
    lazy = true,
    --event = "InsertEnter",
    --keys = "<leader>cp",
    dependencies = {
      {
        "sourcegraph/sg.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
        },
      },
    },
    opts = function(_, opts)
      require("sg").setup(opts)
      table.insert(opts.sources, 1, {
        name = "cody",
        group_index = 1,
        priority = 101
    })
    end,
  },
  --{
  --  "nvim-lualine/lualine.nvim",
  --  optional = true,
  --  event = "VeryLazy",
  --  opts = function(_, opts)
  --    table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("cody"))
  --  end,
  --},
}
