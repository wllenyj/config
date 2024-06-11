require("user.plugins")

require("lazy").setup({
    "neovim/nvim-lspconfig",
    "tjdevries/lsp_extensions.nvim",
    
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    
    "dcampos/nvim-snippy",
    "dcampos/cmp-snippy",
    
    "jlanzarotta/bufexplorer",
    "dhananjaylatkar/cscope_maps.nvim",

    "vim-airline/vim-airline",
})


require("user.lsp")
require("user.cmp")

