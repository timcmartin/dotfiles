local home = os.getenv("HOME")

return {
  "phrmendes/todotxt.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = { "TodoTxt", "DoneTxt" },
  opts = {
    todotxt = home .. "/Library/CloudStorage/Dropbox/apps/Todotxt+/todo.txt",
    donetxt = home .. "/Library/CloudStorage/Dropbox/apps/Todotxt+/done.txt",
  },
  keys = {
    { "<localleader>tn", "<cmd>TodoTxt new<cr>", desc = "New todo entry" },
    { "<localleader>tt", "<cmd>TodoTxt<cr>", desc = "Toggle todo.txt" },
    { "<localleader>td", "<cmd>DoneTxt<cr>", desc = "Toggle done.txt" },
    {
      "<localleader><cr>",
      function()
        require("todotxt").toggle_todo_state()
      end,
      desc = "Toggle task state",
    },
    {
      "<localleader>tp",
      function()
        require("todotxt").cycle_priority()
      end,
      desc = "Cycle priority",
    },
    {
      "<localleader>tm",
      function()
        require("todotxt").move_done_tasks()
      end,
      desc = "Move done tasks",
    },
    {
      "<localleader>tss",
      function()
        require("todotxt").sort_tasks()
      end,
      desc = "Sort tasks (default)",
    },
    {
      "<localleader>tsp",
      function()
        require("todotxt").sort_tasks_by_priority()
      end,
      desc = "Sort by priority",
    },
    {
      "<localleader>tsc",
      function()
        require("todotxt").sort_tasks_by_context()
      end,
      desc = "Sort by context",
    },
    {
      "<localleader>tsP",
      function()
        require("todotxt").sort_tasks_by_project()
      end,
      desc = "Sort by project",
    },
    {
      "<localleader>tsd",
      function()
        require("todotxt").sort_tasks_by_due_date()
      end,
      desc = "Sort by due date",
    },
  },
}
