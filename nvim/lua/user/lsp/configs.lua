
--vim.lsp.set_log_level("debug")

local nvim_lsp = require("lspconfig")

-- Setup lspconfig.
local function create_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    return capabilities
end

nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    capabilities = create_capabilities(),
    settings = {
        ["rust-analyzer"] = {
            --linkedProjects = {
            --    "out/default/rust-project.json",
            --    "Cargo.toml",
            --},
            --assist = {
            --    importGranularity = "module",
            --    importPrefix = "by_self",
            --},
            cargo = {
                features = "all",
            },
            checkOnSave = {
                features = "all",
            },
            --workspace = {
            --    symbol = {
            --        search = {
            --            limit = 10,
            --        }
            --    }
            --}
        }
    }
})

