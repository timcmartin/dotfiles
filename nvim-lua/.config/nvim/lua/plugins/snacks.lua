return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      ignored = false,
    },
    explorer = {},
  },
  keys = {
    -- Grep
    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sB",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    {
      "<C-n>",
      function()
        Snacks.explorer()
      end,
      desc = "Show explorer",
    },
    {
      "<C-p>",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
  },
}
