return {
	{
		-- LSP keymap configurations
		"neovim/nvim-lspconfig",
		opts = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			-- disable a keymap
			keys[#keys + 1] = { "K", false }
			-- add a keymap
			keys[#keys + 1] = { "<leader>K", vim.lsp.buf.hover, desc = "Hover" }
		end,
	},
	{
		-- LSP server configurations
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ts_ls = {
					root_dir = require("lspconfig").util.root_pattern({ "package.json", "tsconfig.json" }),
					single_file_support = false,
					settings = {},
				},
				denols = {
					root_dir = require("lspconfig").util.root_pattern({ "deno.json", "deno.jsonc" }),
					single_file_support = false,
					init_options = {
						enable = true,
						lint = true,
					},
				},
				vtsls = {
					-- explicitly add default filetypes, so that we can extend
					-- them in related extras
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
					settings = {
						complete_function_calls = true,
						vtsls = {
							enableMoveToFileCodeAction = true,
							autoUseWorkspaceTsdk = true,
							experimental = {
								maxInlayHintLength = 30,
								completion = {
									enableServerSideFuzzyMatch = true,
								},
							},
						},
						typescript = {
							updateImportsOnFileMove = { enabled = "always" },
							suggest = {
								completeFunctionCalls = true,
							},
							inlayHints = {
								enumMemberValues = { enabled = true },
								functionLikeReturnTypes = { enabled = true },
								parameterNames = { enabled = "literals" },
								parameterTypes = { enabled = true },
								propertyDeclarationTypes = { enabled = true },
								variableTypes = { enabled = false },
							},
						},
					},
				},
			},
		},
	},
}
