require("nvim-treesitter.configs").setup(
  {
    highlight = {
      enable = true
    },
    indent = {
      enable = true
    },
    ensure_installed = {
      "bash",
      "css",
      "dockerfile",
      "javascript",
      "lua",
      "ruby",
      "toml",
      "tsx",
      "typescript",
      "yaml"
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm"
      }
    }
  }
)
