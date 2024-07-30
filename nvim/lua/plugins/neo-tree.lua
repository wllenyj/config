return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>e",
      function()
        vim.cmd("Neotree reveal_force_cwd")
      end,
      desc = "Explorer NeoTree (reveal_force_cwd))",
    },
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
      remap = true,
    },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["/"] = "noop",
        },
      },
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(file_path)
          -- auto close
          -- vimc.cmd("Neotree close")
          -- OR
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
  },
}
