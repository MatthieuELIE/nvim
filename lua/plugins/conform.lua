return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	---@module "conform"
	---@type conform.setupOpts
	opts = (function()
		-- Function to check if `deno.json` exists
		local function get_js_ts_formatter()
			return vim.fn.filereadable(vim.fn.getcwd() .. "/deno.json") == 1 and { "deno_fmt" } or { "prettier" }
		end

		return {
			formatters_by_ft = {
				-- Use the reusable function for JS/TS
				javascript = get_js_ts_formatter,
				typescript = get_js_ts_formatter,
				javascriptreact = get_js_ts_formatter,
				typescriptreact = get_js_ts_formatter,

				-- Static formatters for other file types
				lua = { "stylua" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				markdown = { "prettier" },
			},

			default_format_opts = {
				lsp_format = "fallback",
			},
		}
	end)(),
}
