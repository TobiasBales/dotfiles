local sev = vim.diagnostic.severity

require("lint").linters.rubocop = {
  cmd = "rubocop",
  args = {"--force-exclusion", "--stdin", "%:p", "--format", "json"},
  stdin = true,
  parser = function(output)
    local diagnostics = {}
    local decoded = vim.fn.json_decode(output)
    local offences = decoded.files[1].offenses

    for _, off in pairs(offences or {}) do
      table.insert(
        diagnostics,
        {
          lnum = off.location.start_line - 1,
          col = off.location.start_column - 1,
          end_lnum = off.location.last_line - 1,
          end_col = off.location.last_column,
          severity = (off.severity == "error" and sev.ERROR or sev.WARN),
          message = off.message,
          user_data = {
            lsp = {
              code = off.cop_name
            }
          }
        }
      )
    end

    return diagnostics
  end
}

require("lint").linters_by_ft = {
  sh = {"shellcheck"},
  ruby = {"rubocop"}
}

vim.api.nvim_exec([[
  au BufWritePost <buffer> lua require('lint').try_lint()
]], true)
