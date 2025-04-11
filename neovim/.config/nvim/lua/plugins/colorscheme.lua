return {
  --{ "doums/darcula" },
  {
    "xiantang/darcula-dark.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "darcula-dark",
    },
  },
}
