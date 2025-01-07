return {
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      local actions = require("fzf-lua.actions")
      opts["files"]["actions"] = nil
      opts["grep"]["actions"] = nil
      return {
        keymap = {
          builtin = {
            ["<C-e>"] = "preview-down",
            ["<C-y>"] = "preview-up",
            ["<C-f>"] = "preview-page-down",
            ["<C-b>"] = "preview-page-up",
          },
        },
        files = {
          actions = {
            ["ctrl-i"] = { actions.toggle_ignore },
            ["ctrl-h"] = { actions.toggle_hidden },
          },
        },
        grep = {
          actions = {
            ["ctrl-i"] = { actions.toggle_ignore },
            ["ctrl-h"] = { actions.toggle_hidden },
          },
        },
      }
    end,
  },
}
