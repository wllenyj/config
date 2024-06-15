return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",

      --colorschem = "tokyonight-night",
      --colorscheme = "tokyonight-storm",
      --colorscheme = "tokyonight-day",
      --colorscheme = "tokyonight-moon",

      --colorscheme = "catppuccin-latte",
      --colorscheme = "catppuccin-frappe",
      --colorscheme = "catppuccin-macchiato",
      --colorscheme= = "catppuccin-mocha",
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      --vim.o.background = "light"
      vim.o.background = "dark"
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
}
