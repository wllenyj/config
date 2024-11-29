return {
  "mrcjkb/rustaceanvim",
  opts = {
    server = {
      default_settings = {
        ["rust-analyzer"] = {
          rustfmt = {
            extraArgs = { "+nightly" },
          },
          inlayHints = {
            typeHints = {
              enable = true,
            },
            lifetimeElisionHints = {
              enable = true,
              useParameterNames = false,
            },
            expressionAdjustmentHints = { enable = true },
            chainingHints = { enable = true },
            parameterHints = { enable = true },
            bindingModeHints = { enable = true },
            closureCaptureHints = { enable = true },
            closureReturnTypeHints = { enable = true },
            discriminantHints = { enable = true },
            implicitDrops = { enable = true },
          },
        },
      },
    },
  },
}
