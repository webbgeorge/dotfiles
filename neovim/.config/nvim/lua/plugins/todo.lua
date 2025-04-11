return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      highlight = {
        multiline_pattern = "^%s%s",
        pattern = [[.*<(KEYWORDS)]],
        before = "",
        keyword = "fg",
        after = "fg",
      },
      search = {
        pattern = [[\b(KEYWORDS)]],
      },
      colors = {
        error = { "#DC2626" },
        warning = { "#FBBF24" },
        info = { "#ABC023" },
        hint = { "#10B981" },
        default = { "#7C3AED" },
        test = { "#FF00FF" },
      },
    },
  },
}
