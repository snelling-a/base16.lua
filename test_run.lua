local colors = {}

for path in io.popen("cd colors && find . -type f | grep .lua"):lines() do
	local colorscheme = (string.gsub(path, "./", ""):gsub(".lua", ""))
	table.insert(colors, colorscheme)
end

local i = 1
local timer = vim.loop.new_timer()
if timer then
	timer:start(
		0,
		500,
		vim.schedule_wrap(function()
			vim.notify(colors[i], vim.log.levels.INFO, { title = "colorscheme:" })
			vim.cmd("colorscheme " .. colors[i])
			i = i + 1
			if i > #colors then
				timer:close()
			end
		end)
	)
end

local augroup = vim.api.nvim_create_augroup(augroup, { clear = true })
vim.api.nvim_create_autocmd({ "VimLeave" }, {
	group = augroup,
	callback = function() timer:close() end,
})
