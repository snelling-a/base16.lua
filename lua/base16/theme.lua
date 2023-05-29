-- Some useful links for making your own colorscheme:
-- https://github.com/chriskempson/base16
-- https://colourco.de/
-- https://color.adobe.com/create/color-wheel
-- http://vrl.cs.brown.edu/color

local M = {}

function M.with_config(config)
	M.config = vim.tbl_extend("force", {
		telescope = true,
		indentblankline = true,
		notify = true,
		ts_rainbow = true,
		cmp = true,
		illuminate = true,
		lsp_semantic = true,
		mini_completion = true,
	}, config or M.config or {})
end

--- Creates a base16 colorscheme using the colors specified.
--
-- Builtin colorschemes can be found in the M.colorschemes table.
--
-- The default Vim highlight groups (including User), highlight groups
-- pertaining to Neovim's builtin LSP, and highlight groups pertaining to
-- Treesitter will be defined.
--
-- It's worth noting that many colorschemes will specify language specific
-- highlight groups like rubyConstant or pythonInclude. However, I don't do
-- that here since these should instead be linked to an existing highlight
-- group.
--
-- @param colors (table) table with keys 'base00', 'base01', 'base02',
--   'base03', 'base04', 'base05', 'base06', 'base07', 'base08', 'base09',
--   'base0A', 'base0B', 'base0C', 'base0D', 'base0E', 'base0F'. Each key should
--   map to a valid 6 digit hex color. If a string is provided, the
--   corresponding table specifying the colorscheme will be used.
function M._load(colors, config)
	M.with_config(config)

	local Highlights = {}

	-- Vim editor colors
	Highlights.Normal = { fg = colors.base05, bg = colors.base00 }
	Highlights.Bold = {}
	Highlights.Debug = { fg = colors.base08 }
	Highlights.Directory = { fg = colors.base0D }
	Highlights.Error = { fg = colors.base08, bg = colors.base00 }
	Highlights.ErrorMsg = { fg = colors.base08, bg = colors.base00 }
	Highlights.Exception = { fg = colors.base08 }
	Highlights.FoldColumn = { fg = colors.base0C, bg = colors.base00 }
	Highlights.Folded = { fg = colors.base03, bg = colors.base01 }
	Highlights.IncSearch = { fg = colors.base01, bg = colors.base09 }
	Highlights.Italic = {}
	Highlights.Macro = { fg = colors.base08 }
	Highlights.MatchParen = { bg = colors.base03 }
	Highlights.ModeMsg = { fg = colors.base0B }
	Highlights.MoreMsg = { fg = colors.base0B }
	Highlights.Question = { fg = colors.base0D }
	Highlights.Search = { fg = colors.base01, bg = colors.base0A }
	Highlights.Substitute = { fg = colors.base01, bg = colors.base0A }
	Highlights.SpecialKey = { fg = colors.base03 }
	Highlights.TooLong = { fg = colors.base08 }
	Highlights.Underlined = { fg = colors.base08 }
	Highlights.Visual = { bg = colors.base02 }
	Highlights.VisualNOS = { fg = colors.base08 }
	Highlights.WarningMsg = { fg = colors.base08 }
	Highlights.WildMenu = { fg = colors.base08, bg = colors.base0A }
	Highlights.Title = { fg = colors.base0D }
	Highlights.Conceal = { fg = colors.base0D, bg = colors.base00 }
	Highlights.Cursor = { fg = colors.base00, bg = colors.base05 }
	Highlights.NonText = { fg = colors.base03 }
	Highlights.LineNr = { fg = colors.base04, bg = colors.base00 }
	Highlights.SignColumn = { fg = colors.base04, bg = colors.base00 }
	Highlights.StatusLine = { fg = colors.base05, bg = colors.base02 }
	Highlights.StatusLineNC = { fg = colors.base04, bg = colors.base01 }
	Highlights.WinBar = { fg = colors.base05 }
	Highlights.WinBarNC = { fg = colors.base04 }
	Highlights.VertSplit = { fg = colors.base05, bg = colors.base00 }
	Highlights.ColorColumn = { bg = colors.base01 }
	Highlights.CursorColumn = { bg = colors.base01 }
	Highlights.CursorLine = { bg = colors.base01 }
	Highlights.CursorLineNr = { fg = colors.base04, bg = colors.base01 }
	Highlights.QuickFixLine = { bg = colors.base01 }
	Highlights.PMenu = { fg = colors.base05, bg = colors.base01 }
	Highlights.PMenuSel = { fg = colors.base01, bg = colors.base05 }
	Highlights.TabLine = { fg = colors.base03, bg = colors.base01 }
	Highlights.TabLineFill = { fg = colors.base03, bg = colors.base01 }
	Highlights.TabLineSel = { fg = colors.base0B, bg = colors.base01 }

	-- Standard syntax Highlights
	Highlights.Boolean = { fg = colors.base09 }
	Highlights.Character = { fg = colors.base08 }
	Highlights.Comment = { fg = colors.base03 }
	Highlights.Conditional = { fg = colors.base0E }
	Highlights.Constant = { fg = colors.base09 }
	Highlights.Define = { fg = colors.base0E }
	Highlights.Delimiter = { fg = colors.base0F }
	Highlights.Float = { fg = colors.base09 }
	Highlights.Function = { fg = colors.base0D }
	Highlights.Identifier = { fg = colors.base08 }
	Highlights.Include = { fg = colors.base0D }
	Highlights.Keyword = { fg = colors.base0E }
	Highlights.Label = { fg = colors.base0A }
	Highlights.Number = { fg = colors.base09 }
	Highlights.Operator = { fg = colors.base05 }
	Highlights.PreProc = { fg = colors.base0A }
	Highlights.Repeat = { fg = colors.base0A }
	Highlights.Special = { fg = colors.base0C }
	Highlights.SpecialChar = { fg = colors.base0F }
	Highlights.Statement = { fg = colors.base08 }
	Highlights.StorageClass = { fg = colors.base0A }
	Highlights.String = { fg = colors.base0B }
	Highlights.Structure = { fg = colors.base0E }
	Highlights.Tag = { fg = colors.base0A }
	Highlights.Todo = { fg = colors.base0A, bg = colors.base01 }
	Highlights.Type = { fg = colors.base0A }
	Highlights.Typedef = { fg = colors.base0A }

	-- Diff Highlighting
	Highlights.DiffAdd = { fg = colors.base0B, bg = colors.base00 }
	Highlights.DiffChange = { fg = colors.base03, bg = colors.base00 }
	Highlights.DiffDelete = { fg = colors.base08, bg = colors.base00 }
	Highlights.DiffText = { fg = colors.base0D, bg = colors.base00 }
	Highlights.DiffAdded = { fg = colors.base0B, bg = colors.base00 }
	Highlights.DiffFile = { fg = colors.base08, bg = colors.base00 }
	Highlights.DiffNewFile = { fg = colors.base0B, bg = colors.base00 }
	Highlights.DiffLine = { fg = colors.base0D, bg = colors.base00 }
	Highlights.DiffRemoved = { fg = colors.base08, bg = colors.base00 }

	-- Git Highlighting
	Highlights.gitcommitOverflow = { fg = colors.base08 }
	Highlights.gitcommitSummary = { fg = colors.base0B }
	Highlights.gitcommitComment = { fg = colors.base03 }
	Highlights.gitcommitUntracked = { fg = colors.base03 }
	Highlights.gitcommitDiscarded = { fg = colors.base03 }
	Highlights.gitcommitSelected = { fg = colors.base03 }
	Highlights.gitcommitHeader = { fg = colors.base0E }
	Highlights.gitcommitSelectedType = { fg = colors.base0D }
	Highlights.gitcommitUnmergedType = { fg = colors.base0D }
	Highlights.gitcommitDiscardedType = { fg = colors.base0D }
	Highlights.gitcommitBranch = { fg = colors.base09 }
	Highlights.gitcommitUntrackedFile = { fg = colors.base0A }
	Highlights.gitcommitUnmergedFile = { fg = colors.base08 }
	Highlights.gitcommitDiscardedFile = { fg = colors.base08 }
	Highlights.gitcommitSelectedFile = { fg = colors.base0B }

	-- GitGutter Highlighting
	Highlights.GitGutterAdd = { fg = colors.base0B, bg = colors.base00 }
	Highlights.GitGutterChange = { fg = colors.base0D, bg = colors.base00 }
	Highlights.GitGutterDelete = { fg = colors.base08, bg = colors.base00 }
	Highlights.GitGutterChangeDelete = { fg = colors.base0E, bg = colors.base00 }

	-- Spelling Highlighting
	Highlights.SpellBad = { sp = colors.base08 }
	Highlights.SpellLocal = { sp = colors.base0C }
	Highlights.SpellCap = { sp = colors.base0D }
	Highlights.SpellRare = { sp = colors.base0E }

	Highlights.DiagnosticError = { fg = colors.base08 }
	Highlights.DiagnosticWarn = { fg = colors.base0E }
	Highlights.DiagnosticInfo = { fg = colors.base05 }
	Highlights.DiagnosticHint = { fg = colors.base0C }
	Highlights.DiagnosticUnderlineError = { sp = colors.base08 }
	Highlights.DiagnosticUnderlineWarning = { sp = colors.base0E }
	Highlights.DiagnosticUnderlineWarn = { sp = colors.base0E }
	Highlights.DiagnosticUnderlineInformation = { sp = colors.base0F }
	Highlights.DiagnosticUnderlineHint = { sp = colors.base0C }

	Highlights.LspReferenceText = { sp = colors.base04 }
	Highlights.LspReferenceRead = { sp = colors.base04 }
	Highlights.LspReferenceWrite = { sp = colors.base04 }
	Highlights.LspDiagnosticsDefaultError = "DiagnosticError"
	Highlights.LspDiagnosticsDefaultWarning = "DiagnosticWarn"
	Highlights.LspDiagnosticsDefaultInformation = "DiagnosticInfo"
	Highlights.LspDiagnosticsDefaultHint = "DiagnosticHint"
	Highlights.LspDiagnosticsUnderlineError = "DiagnosticUnderlineError"
	Highlights.LspDiagnosticsUnderlineWarning = "DiagnosticUnderlineWarning"
	Highlights.LspDiagnosticsUnderlineInformation = "DiagnosticUnderlineInformation"
	Highlights.LspDiagnosticsUnderlineHint = "DiagnosticUnderlineHint"

	Highlights.TSAnnotation = { fg = colors.base0F }
	Highlights.TSAttribute = { fg = colors.base0A }
	Highlights.TSBoolean = { fg = colors.base09 }
	Highlights.TSCharacter = { fg = colors.base08 }
	Highlights.TSComment = { fg = colors.base03 }
	Highlights.TSConstructor = { fg = colors.base0D }
	Highlights.TSConditional = { fg = colors.base0E }
	Highlights.TSConstant = { fg = colors.base09 }
	Highlights.TSConstBuiltin = { fg = colors.base09 }
	Highlights.TSConstMacro = { fg = colors.base08 }
	Highlights.TSError = { fg = colors.base08 }
	Highlights.TSException = { fg = colors.base08 }
	Highlights.TSField = { fg = colors.base05 }
	Highlights.TSFloat = { fg = colors.base09 }
	Highlights.TSFunction = { fg = colors.base0D }
	Highlights.TSFuncBuiltin = { fg = colors.base0D }
	Highlights.TSFuncMacro = { fg = colors.base08 }
	Highlights.TSInclude = { fg = colors.base0D }
	Highlights.TSKeyword = { fg = colors.base0E }
	Highlights.TSKeywordFunction = { fg = colors.base0E }
	Highlights.TSKeywordOperator = { fg = colors.base0E }
	Highlights.TSLabel = { fg = colors.base0A }
	Highlights.TSMethod = { fg = colors.base0D }
	Highlights.TSNamespace = { fg = colors.base08 }
	Highlights.TSNone = { fg = colors.base05 }
	Highlights.TSNumber = { fg = colors.base09 }
	Highlights.TSOperator = { fg = colors.base05 }
	Highlights.TSParameter = { fg = colors.base05 }
	Highlights.TSParameterReference = { fg = colors.base05 }
	Highlights.TSProperty = { fg = colors.base05 }
	Highlights.TSPunctDelimiter = { fg = colors.base0F }
	Highlights.TSPunctBracket = { fg = colors.base05 }
	Highlights.TSPunctSpecial = { fg = colors.base05 }
	Highlights.TSRepeat = { fg = colors.base0E }
	Highlights.TSString = { fg = colors.base0B }
	Highlights.TSStringRegex = { fg = colors.base0C }
	Highlights.TSStringEscape = { fg = colors.base0C }
	Highlights.TSSymbol = { fg = colors.base0B }
	Highlights.TSTag = { fg = colors.base08 }
	Highlights.TSTagDelimiter = { fg = colors.base0F }
	Highlights.TSText = { fg = colors.base05 }
	Highlights.TSStrong = {}
	Highlights.TSEmphasis = { fg = colors.base09 }
	Highlights.TSUnderline = { fg = colors.base00 }
	Highlights.TSStrike = { fg = colors.base00 }
	Highlights.TSTitle = { fg = colors.base0D }
	Highlights.TSLiteral = { fg = colors.base09 }
	Highlights.TSURI = { fg = colors.base09 }
	Highlights.TSType = { fg = colors.base0A }
	Highlights.TSTypeBuiltin = { fg = colors.base0A }
	Highlights.TSVariable = { fg = colors.base08 }
	Highlights.TSVariableBuiltin = { fg = colors.base08 }

	Highlights.TSDefinition = { sp = colors.base04 }
	Highlights.TSDefinitionUsage = { sp = colors.base04 }
	Highlights.TSCurrentScope = {}

	Highlights.LspInlayHint = { fg = colors.base03 }

	if vim.fn.has("nvim-0.8.0") then
		Highlights["@comment"] = "TSComment"
		Highlights["@error"] = "TSError"
		Highlights["@none"] = "TSNone"
		Highlights["@preproc"] = "PreProc"
		Highlights["@define"] = "Define"
		Highlights["@operator"] = "TSOperator"
		Highlights["@punctuation.delimiter"] = "TSPunctDelimiter"
		Highlights["@punctuation.bracket"] = "TSPunctBracket"
		Highlights["@punctuation.special"] = "TSPunctSpecial"
		Highlights["@string"] = "TSString"
		Highlights["@string.regex"] = "TSStringRegex"
		Highlights["@string.escape"] = "TSStringEscape"
		Highlights["@string.special"] = "SpecialChar"
		Highlights["@character"] = "TSCharacter"
		Highlights["@character.special"] = "SpecialChar"
		Highlights["@boolean"] = "TSBoolean"
		Highlights["@number"] = "TSNumber"
		Highlights["@float"] = "TSFloat"
		Highlights["@function"] = "TSFunction"
		Highlights["@function.call"] = "TSFunction"
		Highlights["@function.builtin"] = "TSFuncBuiltin"
		Highlights["@function.macro"] = "TSFuncMacro"
		Highlights["@method"] = "TSMethod"
		Highlights["@method.call"] = "TSMethod"
		Highlights["@constructor"] = "TSConstructor"
		Highlights["@parameter"] = "TSParameter"
		Highlights["@keyword"] = "TSKeyword"
		Highlights["@keyword.function"] = "TSKeywordFunction"
		Highlights["@keyword.operator"] = "TSKeywordOperator"
		Highlights["@keyword.return"] = "TSKeyword"
		Highlights["@conditional"] = "TSConditional"
		Highlights["@repeat"] = "TSRepeat"
		Highlights["@debug"] = "Debug"
		Highlights["@label"] = "TSLabel"
		Highlights["@include"] = "TSInclude"
		Highlights["@exception"] = "TSException"
		Highlights["@type"] = "TSType"
		Highlights["@type.builtin"] = "TSTypeBuiltin"
		Highlights["@type.qualifier"] = "TSKeyword"
		Highlights["@type.definition"] = "TSType"
		Highlights["@storageclass"] = "StorageClass"
		Highlights["@attribute"] = "TSAttribute"
		Highlights["@field"] = "TSField"
		Highlights["@property"] = "TSProperty"
		Highlights["@variable"] = "TSVariable"
		Highlights["@variable.builtin"] = "TSVariableBuiltin"
		Highlights["@constant"] = "TSConstant"
		Highlights["@constant.builtin"] = "TSConstant"
		Highlights["@constant.macro"] = "TSConstant"
		Highlights["@namespace"] = "TSNamespace"
		Highlights["@symbol"] = "TSSymbol"
		Highlights["@text"] = "TSText"
		Highlights["@text.diff.add"] = "DiffAdd"
		Highlights["@text.diff.delete"] = "DiffDelete"
		Highlights["@text.strong"] = "TSStrong"
		Highlights["@text.emphasis"] = "TSEmphasis"
		Highlights["@text.underline"] = "TSUnderline"
		Highlights["@text.strike"] = "TSStrike"
		Highlights["@text.title"] = "TSTitle"
		Highlights["@text.literal"] = "TSLiteral"
		Highlights["@text.uri"] = "TSUri"
		Highlights["@text.math"] = "Number"
		Highlights["@text.environment"] = "Macro"
		Highlights["@text.environment.name"] = "Type"
		Highlights["@text.reference"] = "TSParameterReference"
		Highlights["@text.todo"] = "Todo"
		Highlights["@text.note"] = "Tag"
		Highlights["@text.warning"] = "DiagnosticWarn"
		Highlights["@text.danger"] = "DiagnosticError"
		Highlights["@tag"] = "TSTag"
		Highlights["@tag.attribute"] = "TSAttribute"
		Highlights["@tag.delimiter"] = "TSTagDelimiter"
	end

	if M.config.ts_rainbow then
		Highlights.rainbowcol1 = { fg = colors.base06 }
		Highlights.rainbowcol2 = { fg = colors.base09 }
		Highlights.rainbowcol3 = { fg = colors.base0A }
		Highlights.rainbowcol4 = { fg = colors.base07 }
		Highlights.rainbowcol5 = { fg = colors.base0C }
		Highlights.rainbowcol6 = { fg = colors.base0D }
		Highlights.rainbowcol7 = { fg = colors.base0E }
	end

	Highlights.NvimInternalError = { fg = colors.base00, bg = colors.base08 }

	Highlights.NormalFloat = { fg = colors.base05, bg = colors.base00 }
	Highlights.FloatBorder = { fg = colors.base05, bg = colors.base00 }
	Highlights.NormalNC = { fg = colors.base05, bg = colors.base00 }
	Highlights.TermCursor = { fg = colors.base00, bg = colors.base05 }
	Highlights.TermCursorNC = { fg = colors.base00, bg = colors.base05 }

	Highlights.User1 = { fg = colors.base08, bg = colors.base02 }
	Highlights.User2 = { fg = colors.base0E, bg = colors.base02 }
	Highlights.User3 = { fg = colors.base05, bg = colors.base02 }
	Highlights.User4 = { fg = colors.base0C, bg = colors.base02 }
	Highlights.User5 = { fg = colors.base05, bg = colors.base02 }
	Highlights.User6 = { fg = colors.base05, bg = colors.base01 }
	Highlights.User7 = { fg = colors.base05, bg = colors.base02 }
	Highlights.User8 = { fg = colors.base00, bg = colors.base02 }
	Highlights.User9 = { fg = colors.base00, bg = colors.base02 }

	Highlights.TreesitterContext = { bg = colors.base01 }

	if M.config.telescope then
		Highlights.TelescopePromptBorder = { fg = colors.base05, bg = colors.base00 }
		Highlights.TelescopePromptNormal = { fg = colors.base05, bg = colors.base00 }
		Highlights.TelescopePromptPrefix = { fg = colors.base05, bg = colors.base00 }
		Highlights.TelescopeNormal = { bg = colors.base00 }
		Highlights.TelescopePreviewTitle = { fg = colors.base01, bg = colors.base0B }
		Highlights.TelescopePromptTitle = { fg = colors.base01, bg = colors.base08 }
		Highlights.TelescopeResultsTitle = { fg = colors.base05, bg = colors.base00 }
		Highlights.TelescopeSelection = { bg = colors.base01 }
		Highlights.TelescopePreviewLine = { bg = colors.base01 }
	end

	if M.config.notify then
		Highlights.NotifyERRORBorder = { fg = colors.base08 }
		Highlights.NotifyWARNBorder = { fg = colors.base0E }
		Highlights.NotifyINFOBorder = { fg = colors.base05 }
		Highlights.NotifyDEBUGBorder = { fg = colors.base0C }
		Highlights.NotifyTRACEBorder = { fg = colors.base0C }
		Highlights.NotifyERRORIcon = { fg = colors.base08 }
		Highlights.NotifyWARNIcon = { fg = colors.base0E }
		Highlights.NotifyINFOIcon = { fg = colors.base05 }
		Highlights.NotifyDEBUGIcon = { fg = colors.base0C }
		Highlights.NotifyTRACEIcon = { fg = colors.base0C }
		Highlights.NotifyERRORTitle = { fg = colors.base08 }
		Highlights.NotifyWARNTitle = { fg = colors.base0E }
		Highlights.NotifyINFOTitle = { fg = colors.base05 }
		Highlights.NotifyDEBUGTitle = { fg = colors.base0C }
		Highlights.NotifyTRACETitle = { fg = colors.base0C }
		Highlights.NotifyERRORBody = "Normal"
		Highlights.NotifyWARNBody = "Normal"
		Highlights.NotifyINFOBody = "Normal"
		Highlights.NotifyDEBUGBody = "Normal"
		Highlights.NotifyTRACEBody = "Normal"
	end

	if M.config.indentblankline then
		Highlights.IndentBlanklineChar = { fg = colors.base02 }
		Highlights.IndentBlanklineContextChar = { fg = colors.base04 }
	end

	if M.config.cmp then
		Highlights.CmpDocumentationBorder = { fg = colors.base05, bg = colors.base00 }
		Highlights.CmpDocumentation = { fg = colors.base05, bg = colors.base00 }
		Highlights.CmpItemAbbr = { fg = colors.base05, bg = colors.base01 }
		Highlights.CmpItemAbbrDeprecated = { fg = colors.base03 }
		Highlights.CmpItemAbbrMatch = { fg = colors.base0D }
		Highlights.CmpItemAbbrMatchFuzzy = { fg = colors.base0D }
		Highlights.CmpItemKindDefault = { fg = colors.base05 }
		Highlights.CmpItemMenu = { fg = colors.base04 }
		Highlights.CmpItemKindKeyword = { fg = colors.base0E }
		Highlights.CmpItemKindVariable = { fg = colors.base08 }
		Highlights.CmpItemKindConstant = { fg = colors.base09 }
		Highlights.CmpItemKindReference = { fg = colors.base08 }
		Highlights.CmpItemKindValue = { fg = colors.base09 }
		Highlights.CmpItemKindFunction = { fg = colors.base0D }
		Highlights.CmpItemKindMethod = { fg = colors.base0D }
		Highlights.CmpItemKindConstructor = { fg = colors.base0D }
		Highlights.CmpItemKindClass = { fg = colors.base0A }
		Highlights.CmpItemKindInterface = { fg = colors.base0A }
		Highlights.CmpItemKindStruct = { fg = colors.base0A }
		Highlights.CmpItemKindEvent = { fg = colors.base0A }
		Highlights.CmpItemKindEnum = { fg = colors.base0A }
		Highlights.CmpItemKindUnit = { fg = colors.base0A }
		Highlights.CmpItemKindModule = { fg = colors.base05 }
		Highlights.CmpItemKindProperty = { fg = colors.base08 }
		Highlights.CmpItemKindField = { fg = colors.base08 }
		Highlights.CmpItemKindTypeParameter = { fg = colors.base0A }
		Highlights.CmpItemKindEnumMember = { fg = colors.base0A }
		Highlights.CmpItemKindOperator = { fg = colors.base05 }
		Highlights.CmpItemKindSnippet = { fg = colors.base04 }
	end

	if M.config.illuminate then
		Highlights.IlluminatedWordText = { sp = colors.base04 }
		Highlights.IlluminatedWordRead = { sp = colors.base04 }
		Highlights.IlluminatedWordWrite = { sp = colors.base04 }
	end

	if M.config.lsp_semantic then
		Highlights["@class"] = "TSType"
		Highlights["@struct"] = "TSType"
		Highlights["@enum"] = "TSType"
		Highlights["@enumMember"] = "Constant"
		Highlights["@event"] = "Identifier"
		Highlights["@interface"] = "Structure"
		Highlights["@modifier"] = "Identifier"
		Highlights["@regexp"] = "TSStringRegex"
		Highlights["@typeParameter"] = "Type"
		Highlights["@decorator"] = "Identifier"

		-- TODO: figure out what these should be
		-- Highlights['@lsp.type.namespace'] = '@namespace'
		-- Highlights['@lsp.type.type'] = '@type'
		-- Highlights['@lsp.type.class'] = '@type'
		-- Highlights['@lsp.type.enum'] = '@type'
		-- Highlights['@lsp.type.interface'] = '@type'
		-- Highlights['@lsp.type.struct'] = '@structure'
		-- Highlights['@lsp.type.parameter'] = '@parameter'
		-- Highlights['@lsp.type.variable'] = '@variable'
		-- Highlights['@lsp.type.property'] = '@property'
		-- Highlights['@lsp.type.enumMember'] = '@constant'
		-- Highlights['@lsp.type.function'] = '@function'
		-- Highlights['@lsp.type.method'] = '@method'
		-- Highlights['@lsp.type.macro'] = '@macro'
		-- Highlights['@lsp.type.decorator'] = '@function'
	end

	if M.config.mini_completion then
		Highlights.MiniCompletionActiveParameter = "CursorLine"
	end

	for group, args in pairs(Highlights) do
		require("base16.utils").highlight(group, args)
	end

	vim.g.terminal_color_0 = colors.base00
	vim.g.terminal_color_1 = colors.base08
	vim.g.terminal_color_2 = colors.base0B
	vim.g.terminal_color_3 = colors.base0A
	vim.g.terminal_color_4 = colors.base0D
	vim.g.terminal_color_5 = colors.base0E
	vim.g.terminal_color_6 = colors.base0C
	vim.g.terminal_color_7 = colors.base05
	vim.g.terminal_color_8 = colors.base03
	vim.g.terminal_color_9 = colors.base08
	vim.g.terminal_color_10 = colors.base0B
	vim.g.terminal_color_11 = colors.base0A
	vim.g.terminal_color_12 = colors.base0D
	vim.g.terminal_color_13 = colors.base0E
	vim.g.terminal_color_14 = colors.base0C
	vim.g.terminal_color_15 = colors.base07

	vim.g.base16_00 = colors.base00
	vim.g.base16_01 = colors.base01
	vim.g.base16_02 = colors.base02
	vim.g.base16_03 = colors.base03
	vim.g.base16_04 = colors.base04
	vim.g.base16_05 = colors.base05
	vim.g.base16_06 = colors.base06
	vim.g.base16_07 = colors.base07
	vim.g.base16_08 = colors.base08
	vim.g.base16_09 = colors.base09
	vim.g.base16_0A = colors.base0A
	vim.g.base16_0B = colors.base0B
	vim.g.base16_0C = colors.base0C
	vim.g.base16_0D = colors.base0D
	vim.g.base16_0E = colors.base0E
	vim.g.base16_0F = colors.base0F
end

function M.available_colorschemes() return vim.tbl_keys(M.colorschemes) end

M.colorschemes = {}
setmetatable(M.colorschemes, {
	__index = function(t, key)
		t[key] = require(string.format("colors.%s", key))
		return t[key]
	end,
})

return M
