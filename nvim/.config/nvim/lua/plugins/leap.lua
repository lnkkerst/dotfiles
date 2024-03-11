return {
  {
    enabled = false,
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    enabled = false,
    "ggandor/flit.nvim",
    config = true,
  },
}
