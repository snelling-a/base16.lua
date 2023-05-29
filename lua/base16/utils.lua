local function parse_color(color)
	color = color:lower()

	if not color:find("#") and color ~= "none" then
		color = vim.api.nvim_get_color_by_name(color)
	end

	if color == -1 then
		return print("invalid color")
	end

	return color
end

local Utils = {}

---wrapper for |nvim_set_hl()|
---@param group string
---@param colors table|string: Colors Keys: fg,bg,sp,underline,undercurl,nocombine
function Utils.highlight(group, colors)
	local hi = vim.api.nvim_set_hl
	if type(colors) == "string" then
		hi(0, group, { link = colors })
	else
		local fg = colors.fg and parse_color(colors.fg) or "none"
		local bg = colors.bg and parse_color(colors.bg) or "none"
		local sp = colors.sp and parse_color(colors.sp) or ""

		colors = vim.tbl_extend("force", colors, { fg = fg, bg = bg, sp = sp })
		vim.api.nvim_set_hl(0, group, colors)
	end
end

return Utils
