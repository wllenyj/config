return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      keymap = {
        builtin = {
          true,
          ["<C-e>"] = "preview-down",
          ["<C-y>"] = "preview-up",
          ["<C-f>"] = "preview-page-down",
          ["<C-b>"] = "preview-page-up",
        },
      },
      --files = {
      --  actions = {
      --    ["ctrl-i"] = { actions.toggle_ignore },
      --    ["ctrl-h"] = { actions.toggle_hidden },
      --  },
      --},
      --grep = {
      --  actions = {
      --    ["ctrl-i"] = { actions.toggle_ignore },
      --    ["ctrl-h"] = { actions.toggle_hidden },
      --  },
      --},
    },
  },
}
