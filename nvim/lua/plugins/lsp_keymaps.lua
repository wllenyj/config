-- LSP keymaps
return {
  "neovim/nvim-lspconfig",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    keys[#keys + 1] = {
      "gd",
      function()
        vim.lsp.buf.definition({ reuse_win = false })
      end,
      desc = "Goto Definition",
      has = "definition",
    }
    keys[#keys + 1] = {
      "gr",
      function()
        vim.lsp.buf.references({ reuse_win = false })
      end,
      desc = "References",
      nowait = true,
    }
    keys[#keys + 1] = {
      "gI",
      function()
        vim.lsp.buf.implementation({ reuse_win = false })
      end,
      desc = "Goto Implementation",
    }
    keys[#keys + 1] = {
      "gy",
      function()
        vim.lsp.buf.type_definition({ reuse_win = false })
      end,
      desc = "Goto T[y]pe Definition",
    }
    keys[#keys + 1] = {
      "gD",
      function()
        vim.lsp.buf.declaration({ reuse_win = false })
      end,
      desc = "Goto Declaration",
    }

    -- disable a keymap
    --keys[#keys + 1] = { "K", false }
    -- add a keymap
    --keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
  end,
}
