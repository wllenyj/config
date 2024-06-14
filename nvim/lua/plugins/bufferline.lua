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
      },
      {
        "<localleader>2",
        function()
          require("bufferline.commands").go_to(2, true)
        end,
      },
      {
        "<localleader>3",
        function()
          require("bufferline.commands").go_to(3, true)
        end,
      },
      {
        "<localleader>4",
        function()
          require("bufferline.commands").go_to(4, true)
        end,
      },
      {
        "<localleader>5",
        function()
          require("bufferline.commands").go_to(5, true)
        end,
      },
      {
        "<localleader>6",
        function()
          require("bufferline.commands").go_to(6, true)
        end,
      },
      {
        "<localleader>7",
        function()
          require("bufferline.commands").go_to(7, true)
        end,
      },
      {
        "<localleader>8",
        function()
          require("bufferline.commands").go_to(8, true)
        end,
      },
      {
        "<localleader>9",
        function()
          require("bufferline.commands").go_to(9, true)
        end,
      },
      {
        "<localleader>0",
        function()
          require("bufferline.commands").go_to(-1, true)
        end,
      },
    },
  },
}
