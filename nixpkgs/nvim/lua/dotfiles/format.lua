local javascript = {
  function()
    return {
      exe = "prettier",
      args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
      stdin = true
    }
  end
}

require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = javascript,
      typescript = javascript,
      typescriptreact = javascript,
      rust = {
        function()
          return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true}
        end
      },
      lua = {
        -- luafmt
        function()
          return {exe = "luafmt", args = {"--indent-count", 2, "--stdin"}, stdin = true}
        end
      },
      elixir = {
        -- mix format
        function()
          return {exe = "mix", args = {"format", vim.api.nvim_buf_get_name(0)}, stdin = false}
        end
      }
    }
  }
)
