return {
  "nvim-neo-tree/neo-tree.nvim",
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
