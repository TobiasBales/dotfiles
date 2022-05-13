local null = require("null-ls")
null.setup({
	sources = {
		-- null.builtins.completion.spell,
		null.builtins.diagnostics.ansiblelint,
		null.builtins.diagnostics.credo,
		null.builtins.diagnostics.eslint,
		-- null.builtins.diagnostics.golangci_lint,
		null.builtins.diagnostics.luacheck,
		null.builtins.diagnostics.markdownlint,
		null.builtins.diagnostics.protolint,
		null.builtins.diagnostics.rubocop,
		null.builtins.diagnostics.shellcheck,
		null.builtins.diagnostics.stylelint,
		null.builtins.diagnostics.yamllint,
		null.builtins.formatting.dart_format,
		null.builtins.formatting.goimports,
		null.builtins.formatting.rubocop,
		null.builtins.formatting.stylua,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
})
