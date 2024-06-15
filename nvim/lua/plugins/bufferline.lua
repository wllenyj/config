return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        numbers = function(opts)
          local state = require("bufferline.state")
          for i, buf in ipairs(state.components) do
            if buf.id == opts.id then
              return i
            end
          end
          return opts.ordinal
        end,
      },
    },
    keys = {
      {
        "<localleader>1",
        function()
          require("bufferline.commands").go_to(1, true)
        end,
        desc = "Go to 1 th tab",
      },
      {
        "<localleader>2",
        function()
          require("bufferline.commands").go_to(2, true)
        end,
        desc = "Go to 2 th tab",
      },
      {
        "<localleader>3",
        function()
          require("bufferline.commands").go_to(3, true)
        end,
        desc = "Go to 3 th tab",
      },
      {
        "<localleader>4",
        function()
          require("bufferline.commands").go_to(4, true)
        end,
        desc = "Go to 4 th tab",
      },
      {
        "<localleader>5",
        function()
          require("bufferline.commands").go_to(5, true)
        end,
        desc = "Go to 5 th tab",
      },
      {
        "<localleader>6",
        function()
          require("bufferline.commands").go_to(6, true)
        end,
        desc = "Go to 6 th tab",
      },
      {
        "<localleader>7",
        function()
          require("bufferline.commands").go_to(7, true)
        end,
        desc = "Go to 7 th tab",
      },
      {
        "<localleader>8",
        function()
          require("bufferline.commands").go_to(8, true)
        end,
        desc = "Go to 8 th tab",
      },
      {
        "<localleader>9",
        function()
          require("bufferline.commands").go_to(9, true)
        end,
        desc = "Go to 9 th tab",
      },
      {
        "<localleader>0",
        function()
          require("bufferline.commands").go_to(-1, true)
        end,
        desc = "Go to last tab",
      },
    },
  },
}
