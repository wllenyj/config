return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.remove(opts.sections.lualine_c, 4)
      table.insert(opts.sections.lualine_c, {
        LazyVim.lualine.pretty_path({ relative = "cwd", length = 10 }),
      })
    end,
  },
}
