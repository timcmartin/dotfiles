return {
  "vimwiki/vimwiki",
  event = "BufEnter *.wiki",
  keys = { "<leader>ww", "<leader>wt" },
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "$DROPBOX_DIR/vimwiki/getty",
        syntax = "default",
        ext = ".wiki",
        name = "Getty",
      },
      {
        path = "$DROPBOX_DIR/vimwiki/personal",
        path_html = "",
        syntax = "default",
        ext = ".wiki",
        name = "Personal",
      },
    }
    vim.g.vimwiki_ext2syntax = {
      [".md"] = "markdown",
      [".markdown"] = "markdown",
      [".mdown"] = "markdown",
    }
    vim.g.vimwiki_option_nested_syntaxes = {
      ["python"] = "python",
      ["c++"] = "cpp",
      ["ruby"] = "ruby",
      ["cmd"] = "sh",
      ["bash"] = "sh",
      ["slim"] = "sass",
    }
    vim.g.vimwiki_option_automatic_nested_syntaxes = 1
    vim.g.vimwiki_hl_headers = 1
    vim.cmd([[
      hi VimwikiHeader1 guifg=#ffb86c
      hi VimwikiHeader2 guifg=#50fa7b
      hi VimwikiHeader3 guifg=#f1fa8c
      hi VimwikiHeader4 guifg=#bd93f9
      hi VimwikiHeader5 guifg=#ff5555
      hi VimwikiLink guifg=#719cd6 gui=underline
      hi VimwikiListTodo guifg=#81b29a
    ]])
  end,
}
