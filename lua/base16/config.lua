local M = {}

M.colorschemes = {}

setmetatable(M.colorschemes, {
	__index = function(t, key)
		t[key] = require(string.format("colors.%s", key))
		return t[key]
	end,
})

---@param colors Colorscheme|string
function M.setup(colors)
	if vim.g.colors_name then
		vim.cmd.hi("clear")
	end

	if type(colors) == "string" then
		colors = M.colorschemes[colors]
	end

	if vim.fn.exists("syntax_on") then
		vim.opt.syntax = ""
	end

	if vim.fn.exists("+termguicolors") == 1 and not vim.opt.termguicolors:get() then
		vim.opt.termguicolors = true
	end

	M.colors = colors or M.colorschemes[vim.env.BASE16_THEME]

	require("base16.theme").load(colors)
end

return M
