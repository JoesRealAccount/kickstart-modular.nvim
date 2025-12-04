return {
  {
    "https://gitlab.com/itaranto/plantuml.nvim",
    version = "*",
    config = function()
      require("plantuml").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        plantuml_lsp = {
          cmd = {
            "/home/joe/.local/share/mise/installs/go/1.25.3/bin/plantuml-lsp", -- Update this path
            "--stdlib-path=/home/joe/plantuml-stdlib", -- Update this path
            -- "--jar-path=/path/to/plantuml.jar", -- Uncomment if using jar
            "--exec-path=plantuml", -- Uncomment if using plantuml executable
          },
          filetypes = { "plantuml" },
          root_dir = function(fname)
            local startpath = vim.fn.fnamemodify(fname, ":h")
            local handle = io.popen("git -C " .. startpath .. " rev-parse --show-toplevel 2>/dev/null")
            local git_root = handle:read("*a")
            handle:close()

            -- Trim whitespace
            git_root = git_root:gsub("%s+", "")

            return git_root
          end,
          settings = {},
        },
      },
    },
  },
}
