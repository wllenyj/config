return {
  {
    "jedrzejboczar/nvim-dap-cortex-debug",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    --opts = function(_, opts)
    --  opts.dap_vscode_filetypes = { "c", "cpp", "rust" }
    --  --require("dap-cortex-debug").setup(opts)
    --end,
    opts = {
      dap_vscode_filetypes = { "c", "cpp", "rust" },
    },
  },
}
