return {
  {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
      "folke/which-key.nvim",
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    --config = function(_, opts)
    --  require("cscope_maps").setup(opts)
    --end,
    opts = {
      prefix = "<localleader>g",
      skip_input_prompt = true,
      cscope = {
        picker = "telescope",
        skip_picker_for_single_result = true,
        db_build_cmd_args = { "-Rbqkv" },
      },
    },
  },
}
