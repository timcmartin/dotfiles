return {
  {
    "rgroli/other.nvim",
    config = function()
      require("other-nvim").setup({
        mappings = {
          -- builtin mappings
          "rails",
          -- custom mapping
          {
            pattern = "/app/javascript/react/(.*)/(.*)/(.*)/(.*).jsx",
            target = "/app/javascript/react/%1/%2/%3/%4.test.jsx",
            context = "test",
          },
          {
            pattern = "/app/javascript/react/(.*)/(.*)/(.*)/(.*).test.jsx",
            target = "/app/javascript/react/%1/%2/%3/%4.jsx",
            context = "test",
          },
          {
            pattern = "/app/javascript/react/(.*)/(.*)/(.*)/(.*).js",
            target = "/app/javascript/react/%1/%2/%3/%4.test.js",
            context = "test",
          },
          {
            pattern = "/app/javascript/react/(.*)/(.*)/(.*)/(.*).test.js",
            target = "/app/javascript/react/%1/%2/%3/%4.js",
            context = "test",
          },
          {
            pattern = "/app/javascript/react/(.*)/(.*)/(.*)/(.*)/(.*).jsx",
            target = "/app/javascript/react/%1/%2/%3/%4/%5.test.jsx",
            context = "test",
          },
          {
            pattern = "/app/javascript/react/(.*)/(.*)/(.*)/(.*)/(.*).test.jsx",
            target = "/app/javascript/react/%1/%2/%3/%4/%5.jsx",
            context = "test",
          },
          {
            pattern = "/app/javascript/react/(.*)/(.*)/(.*)/(.*)/(.*).js",
            target = "/app/javascript/react/%1/%2/%3/%4/%5.test.jsx",
            context = "test",
          },
          {
            pattern = "/app/javascript/react/(.*)/(.*)/(.*)/(.*)/(.*).test.js",
            target = "/app/javascript/react/%1/%2/%3/%4/%5.jsx",
            context = "test",
          },
        },
      })
    end,
  },
}
