
--vim.lsp.set_log_level("debug")

---- Setup lspconfig.
local function create_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    return capabilities
end

return {
    {
        "neovim/nvim-lspconfig",
        --dependencies = { "simrat39/rust-tools.nvim", "rust-lang/rust.vim" },
        opts = {
            servers = {
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = { allFeatures = true },
                            checkOnSave = {
                                command = "cargo clippy",
                                extraArgs = { "--no-deps" },
                            },
                        },
                    },
                },
            },

        },
        config = function(_, opts)
            local nvim_lsp = require("lspconfig")
            nvim_lsp.rust_analyzer.setup({
                on_attach=on_attach,
                capabilities = create_capabilities(),
            })
        end,
    }
}
