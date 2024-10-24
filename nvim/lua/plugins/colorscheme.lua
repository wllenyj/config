--vim.highlight.priorities.semantic_tokens = 95
return {
  {
    "LazyVim/LazyVim",
    opts = {
      --colorscheme = "molokai-ori",
      --colorscheme = "dracula",
      colorscheme = "gruvbox",

      --colorscheme = "onedark",

      --colorschem = "tokyonight-night",
      --colorscheme = "tokyonight-storm",
      --colorscheme = "tokyonight-day",
      --colorscheme = "tokyonight-moon",

      --colorscheme = "catppuccin-latte",
      --colorscheme = "catppuccin-frappe",
      --colorscheme = "catppuccin-macchiato",
      --colorscheme = "catppuccin-mocha",
    },
  },
  { "Mofiqul/dracula.nvim", lazy = true },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
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
  {
    "navarasu/onedark.nvim",
    lazy = true,
    -- dark, darker, cool, deep, warm, warmer, light
    opts = { style = "warmer" },
  },
  {
    "UtkarshVerma/molokai.nvim",
    lazy = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        disable = { "rust" },
      },
    },
  },
}
