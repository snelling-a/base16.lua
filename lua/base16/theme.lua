-- vim:foldmethod=marker
-- Some useful links for making your own colorscheme:
-- https://github.com/chriskempson/base16
-- https://colourco.de/
-- https://color.adobe.com/create/color-wheel
-- http://vrl.cs.brown.edu/color

---@class Colorscheme
---@field base00 string -- Default Background
---@field base01 string -- Lighter Background (Used for status bars, line number and folding marks)
---@field base02 string -- Selection Background
---@field base03 string -- Comments, Invisibles, Line Highlighting
---@field base04 string -- Dark Foreground (Used for status bars)
---@field base05 string -- Default Foreground, Caret, Delimiters, Operators
---@field base06 string -- Light Foreground (Not often used)
---@field base07 string -- Light Background (Not often used)
---@field base08 string -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
---@field base09 string -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
---@field base0A string -- Classes, Markup Bold, Search Text Background
---@field base0B string -- Strings, Inherited Class, Markup Code, Diff Inserted
---@field base0C string -- Support, Regular Expressions, Escape Characters, Markup Quotes
---@field base0D string -- Functions, Methods, Attribute IDs, Headings
---@field base0E string -- Keywords, Storage, Selector, Markup Italic, Diff Changed
---@field base0F string -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

local M = {}

--- Creates a base16 colorscheme using the colors specified.
--
-- Builtin colorschemes can be found in the M.colorschemes table.
--
-- The default Vim highlight groups (including User[1-9]), highlight groups
-- pertaining to Neovim's builtin LSP, and highlight groups pertaining to
-- Treesitter will be defined.
--
-- It's worth noting that many colorschemes will specify language specific
-- highlight groups like rubyConstant or pythonInclude. However, I don't do
-- that here since these should instead be linked to an existing highlight
-- group.
--
-- 'base00', 'base01', 'base02', 'base03', 'base04', 'base05', 'base06', 'base07',
-- 'base08', 'base09', 'base0A', 'base0B', 'base0C', 'base0D', 'base0E', 'base0F'.
-- Each key should map to a valid 6 digit hex color.
---@param colors Colorscheme
function M.load(colors)
	local Highlights = {}

	-- Vim editor colors {{{
	Highlights.Bold = { bold = true }
	Highlights.ColorColumn = { link = "CursorLine" }
	Highlights.Conceal = { fg = colors.base0D }
	Highlights.Cursor = { fg = colors.base00, bg = colors.base05 }
	Highlights.CursorColumn = { link = "CursorLine" }
	Highlights.CursorLine = { bg = colors.base01 }
	Highlights.CursorLineNr = { fg = colors.base04, bg = colors.base01 }
	Highlights.Debug = { fg = colors.base08 }
	Highlights.Directory = { fg = colors.base0D }
	Highlights.Error = { fg = colors.base00, bg = colors.base08 }
	Highlights.ErrorMsg = { fg = colors.base08 }
	Highlights.Exception = { fg = colors.base08 }
	Highlights.FoldColumn = { fg = colors.base0C }
	Highlights.Folded = { fg = colors.base03, bg = colors.base01 }
	Highlights.IncSearch = { fg = colors.base01, bg = colors.base09 }
	Highlights.Italic = { italic = true }
	Highlights.LineNr = { fg = colors.base04 }
	Highlights.Macro = { fg = colors.base08 }
	Highlights.MatchParen = { bg = colors.base03 }
	Highlights.ModeMsg = { fg = colors.base0B }
	Highlights.NonText = { fg = colors.base03 }
	Highlights.Normal = { fg = colors.base05, bg = colors.base00 }
	Highlights.PMenu = { fg = colors.base05, bg = colors.base01 }
	Highlights.PMenuSel = { fg = colors.base01, bg = colors.base05 }
	Highlights.Question = { fg = colors.base0D }
	Highlights.QuickFixLine = { link = "CursorLine" }
	-- Highlights.Search = { fg = colors.base01, bg = colors.base0A }
	Highlights.Search = { reverse = true }
	Highlights.SignColumn = { fg = colors.base04 }
	Highlights.SpecialKey = { fg = colors.base03 }
	Highlights.StatusLine = { fg = colors.base05, bg = colors.base02 }
	Highlights.StatusLineNC = { fg = colors.base04 }
	Highlights.Substitute = { fg = colors.base01, bg = colors.base0A }
	Highlights.TabLine = { link = "StatusLineNC" }
	Highlights.TabLineFill = { link = "StatusLine" }
	Highlights.TabLineSel = { fg = colors.base0B, bg = colors.base02 }
	Highlights.TermCursor = { fg = colors.base00, bg = colors.base05 }
	Highlights.TermCursorNC = { fg = colors.base00, bg = colors.base05 }
	Highlights.Title = { fg = colors.base0D }
	Highlights.TooLong = { fg = colors.base08 }
	Highlights.Underlined = { fg = colors.base08 }
	Highlights.VertSplit = { fg = colors.base05 }
	Highlights.Visual = { bg = colors.base02 }
	Highlights.VisualNOS = { fg = colors.base08 }
	Highlights.WarningMsg = { fg = colors.base08 }
	Highlights.WildMenu = { fg = colors.base08, bg = colors.base0A }
	Highlights.WinBar = { fg = colors.base05, bg = colors.base01 }
	Highlights.WinBarNC = { fg = colors.base04 }
	-- Command-line expressions highlighting
	-- all other highlight groups have default links :h |expr-highlight|
	Highlights.NvimInternalError = { fg = colors.base00, bg = colors.base08 }
	-- }}}

	-- Standard syntax highlighting {{{
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
	Highlights.Todo = { fg = colors.base0A }
	Highlights.Type = { fg = colors.base0A }
	Highlights.Typedef = { fg = colors.base0A }
	-- }}}

	-- Diff highlighting {{{
	Highlights.DiffAdd = { fg = colors.base0B }
	Highlights.DiffChange = { fg = colors.base0E }
	Highlights.DiffDelete = { fg = colors.base08 }
	Highlights.DiffText = { fg = colors.base0D }
	Highlights.DiffAdded = { fg = colors.base0B }
	Highlights.DiffFile = { fg = colors.base08 }
	Highlights.DiffNewFile = { fg = colors.base0B }
	Highlights.DiffLine = { fg = colors.base0E }
	Highlights.DiffRemoved = { fg = colors.base08 }
	-- }}}

	-- Git commit highlighting {{{
	Highlights.gitcommitOverflow = { link = "ErrorMsg" }
	Highlights.gitcommitSummary = { fg = colors.base0B }
	Highlights.gitcommitComment = { fg = colors.base03 }
	Highlights.gitcommitUntracked = { link = "NonText" }
	Highlights.gitcommitDiscarded = { fg = colors.base08 }
	Highlights.gitcommitSelected = { fg = colors.base02 }
	Highlights.gitcommitHeader = { link = "Title" }
	Highlights.gitcommitSelectedType = { fg = colors.base0D }
	Highlights.gitcommitUnmergedType = { fg = colors.base0D }
	Highlights.gitcommitDiscardedType = { fg = colors.base0D }
	Highlights.gitcommitBranch = { fg = colors.base0E, bold = true }
	Highlights.gitcommitUntrackedFile = { fg = colors.base03 }
	Highlights.gitcommitUnmergedFile = { fg = colors.base08, bold = true }
	Highlights.gitcommitDiscardedFile = { fg = colors.base08, bold = true }
	Highlights.gitcommitSelectedFile = { fg = colors.base0B, bold = true }
	-- }}}

	-- Spelling highlighting {{{
	Highlights.SpellBad = { link = "DiagnosticUnderlineError" }
	Highlights.SpellLocal = { link = "DiagnosticUnderlineHint" }
	Highlights.SpellCap = { undercurl = true, sp = colors.base0D }
	Highlights.SpellRare = { link = "DiagnosticUnderlineWarning" }
	-- }}}

	-- Diagnostics {{{
	Highlights.DiagnosticDeprecated = { fg = colors.base0F, strikethrough = true }
	Highlights.DiagnosticError = { fg = colors.base08 }
	Highlights.DiagnosticHint = { fg = colors.base0C }
	Highlights.DiagnosticInfo = { fg = colors.base05 }
	Highlights.DiagnosticOk = { fg = colors.base0B }
	Highlights.DiagnosticUnderlineError = { undercurl = true, sp = colors.base08 }
	Highlights.DiagnosticUnderlineHint = { undercurl = true, sp = colors.base0C }
	Highlights.DiagnosticUnderlineInfo = { undercurl = true, sp = colors.base05 }
	Highlights.DiagnosticUnderlineOk = { undercurl = true, sp = colors.base0B }
	Highlights.DiagnosticUnderlineWarn = { undercurl = true, sp = colors.base0E }
	Highlights.DiagnosticUnderlineWarning = { undercurl = true, sp = colors.base0E }
	Highlights.DiagnosticWarn = { fg = colors.base0E }
	-- }}}

	-- LSP {{{
	Highlights.LspCodeLens = { link = "TSComment" }
	Highlights.LspCodeLensSeparator = { link = "TSComment" }
	Highlights.LspDiagnosticsDefaultError = { link = "DiagnosticError" }
	Highlights.LspDiagnosticsDefaultHint = { link = "DiagnosticHint" }
	Highlights.LspDiagnosticsDefaultInformation = { link = "DiagnosticInfo" }
	Highlights.LspDiagnosticsDefaultWarning = { link = "DiagnosticWarn" }
	Highlights.LspDiagnosticsUnderlineError = { link = "DiagnosticUnderlineError" }
	Highlights.LspDiagnosticsUnderlineHint = { link = "DiagnosticUnderlineHint" }
	Highlights.LspDiagnosticsUnderlineInformation = { link = "DiagnosticUnderlineInformation" }
	Highlights.LspDiagnosticsUnderlineWarning = { link = "DiagnosticUnderlineWarning" }
	Highlights.LspInlayHint = { link = "TSComment" }
	Highlights.LspReferenceRead = { bg = colors.base02, sp = colors.base02 }
	Highlights.LspReferenceText = { bg = colors.base02, sp = colors.base02 }
	Highlights.LspReferenceWrite = { bg = colors.base02, sp = colors.base02 }
	Highlights.LspSignatureActiveParameter = { link = "TSComment" }
	Highlights["@lsp.type.class"] = { link = "@type", default = true }
	Highlights["@lsp.type.decorator"] = { link = "@function", default = true }
	Highlights["@lsp.type.enum"] = { link = "@type", default = true }
	Highlights["@lsp.type.enumMember"] = { link = "@constant", default = true }
	Highlights["@lsp.type.function"] = { link = "@function", default = true }
	Highlights["@lsp.type.interface"] = { link = "@type", default = true }
	Highlights["@lsp.type.macro"] = { link = "@macro", default = true }
	Highlights["@lsp.type.method"] = { link = "@method", default = true }
	Highlights["@lsp.type.namespace"] = { link = "@namespace", default = true }
	Highlights["@lsp.type.parameter"] = { link = "@parameter", default = true }
	Highlights["@lsp.type.property"] = { link = "@property", default = true }
	Highlights["@lsp.type.struct"] = { link = "@structure", default = true }
	Highlights["@lsp.type.type"] = { link = "@type", default = true }
	Highlights["@lsp.type.variable"] = { link = "@variable", default = true }
	-- }}}

	-- Treesitter {{{
	Highlights.TSAnnotation = { fg = colors.base0F }
	Highlights.TSAttribute = { fg = colors.base0A }
	Highlights.TSBoolean = { link = "Boolean" }
	Highlights.TSCharacter = { link = "Character" }
	Highlights.TSComment = { fg = colors.base03, italic = true }
	Highlights.TSConditional = { link = "Conditional" }
	Highlights.TSConstant = { link = "Constant" }
	Highlights.TSConstBuiltin = { fg = colors.base09, italic = true }
	Highlights.TSConstMacro = { fg = colors.base08 }
	Highlights.TSConstructor = { fg = colors.base0D }
	Highlights.TSCurrentScope = { bold = true }
	Highlights.TSDefinition = { underline = true, sp = colors.base04 }
	Highlights.TSDefinitionUsage = { underline = true, sp = colors.base04 }
	Highlights.TSEmphasis = { fg = colors.base09, italic = true }
	Highlights.TSError = { link = "ErrorMsg" }
	Highlights.TSException = { link = "Exception" }
	Highlights.TSField = { fg = colors.base05 }
	Highlights.TSFloat = { link = "Float" }
	Highlights.TSFuncBuiltin = { fg = colors.base0D, italic = true }
	Highlights.TSFuncMacro = { fg = colors.base08 }
	Highlights.TSFunction = { link = "Function" }
	Highlights.TSInclude = { link = "Include" }
	Highlights.TSKeyword = { link = "Keyword" }
	Highlights.TSKeywordFunction = { fg = colors.base0E }
	Highlights.TSKeywordOperator = { fg = colors.base0E }
	Highlights.TSLabel = { link = "Label" }
	Highlights.TSLiteral = { fg = colors.base09 }
	Highlights.TSMethod = { fg = colors.base0D }
	Highlights.TSNamespace = { fg = colors.base08 }
	Highlights.TSNone = { link = "NonText" }
	Highlights.TSNumber = { link = "Number" }
	Highlights.TSOperator = { link = "Operator" }
	Highlights.TSParameter = { fg = colors.base05 }
	Highlights.TSParameterReference = { fg = colors.base05 }
	Highlights.TSProperty = { fg = colors.base05 }
	Highlights.TSPunctBracket = { fg = colors.base05 }
	Highlights.TSPunctDelimiter = { fg = colors.base0F }
	Highlights.TSPunctSpecial = { fg = colors.base05 }
	Highlights.TSRepeat = { link = "Repeat" }
	Highlights.TSStrike = { fg = colors.base03, strikethrough = true }
	Highlights.TSString = { fg = colors.base0B }
	Highlights.TSStringEscape = { fg = colors.base0C }
	Highlights.TSStringRegex = { fg = colors.base0C }
	Highlights.TSStrong = { link = "Bold" }
	Highlights.TSSymbol = { fg = colors.base0B }
	Highlights.TSTag = { link = "Tag" }
	Highlights.TSTagDelimiter = { fg = colors.base0F }
	Highlights.TSText = { fg = colors.base05 }
	Highlights.TSTitle = { link = "Title" }
	Highlights.TSType = { link = "Type" }
	Highlights.TSTypeBuiltin = { fg = colors.base0A, italic = true }
	Highlights.TSUnderline = { fg = colors.base03, sp = colors.base03, underline = true }
	Highlights.TSURI = { fg = colors.base09, underline = true }
	Highlights.TSVariable = { fg = colors.base08 }
	Highlights.TSVariableBuiltin = { fg = colors.base08, italic = true }
	Highlights["@attribute"] = { link = "TSAttribute" }
	Highlights["@boolean"] = { link = "TSBoolean" }
	Highlights["@character"] = { link = "TSCharacter" }
	Highlights["@character.special"] = { link = "SpecialChar" }
	Highlights["@comment"] = { link = "TSComment" }
	Highlights["@conditional"] = { link = "TSConditional" }
	Highlights["@constant"] = { link = "TSConstant" }
	Highlights["@constant.builtin"] = { link = "TSConstant" }
	Highlights["@constant.macro"] = { link = "TSConstant" }
	Highlights["@constructor"] = { link = "TSConstructor" }
	Highlights["@debug"] = { link = "Debug" }
	Highlights["@define"] = { link = "Define" }
	Highlights["@error"] = { link = "TSError" }
	Highlights["@exception"] = { link = "TSException" }
	Highlights["@field"] = { link = "TSField" }
	Highlights["@float"] = { link = "TSFloat" }
	Highlights["@function"] = { link = "TSFunction" }
	Highlights["@function.builtin"] = { link = "TSFuncBuiltin" }
	Highlights["@function.call"] = { link = "TSFunction" }
	Highlights["@function.macro"] = { link = "TSFuncMacro" }
	Highlights["@include"] = { link = "TSInclude" }
	Highlights["@keyword"] = { link = "TSKeyword" }
	Highlights["@keyword.function"] = { link = "TSKeywordFunction" }
	Highlights["@keyword.operator"] = { link = "TSKeywordOperator" }
	Highlights["@keyword.return"] = { link = "TSKeyword" }
	Highlights["@label"] = { link = "TSLabel" }
	Highlights["@method"] = { link = "TSMethod" }
	Highlights["@method.call"] = { link = "TSMethod" }
	Highlights["@namespace"] = { link = "TSNamespace" }
	Highlights["@none"] = { link = "TSNone" }
	Highlights["@number"] = { link = "TSNumber" }
	Highlights["@operator"] = { link = "TSOperator" }
	Highlights["@parameter"] = { link = "TSParameter" }
	Highlights["@preproc"] = { link = "PreProc" }
	Highlights["@property"] = { link = "TSProperty" }
	Highlights["@punctuation.bracket"] = { link = "TSPunctBracket" }
	Highlights["@punctuation.delimiter"] = { link = "TSPunctDelimiter" }
	Highlights["@punctuation.special"] = { link = "TSPunctSpecial" }
	Highlights["@repeat"] = { link = "TSRepeat" }
	Highlights["@storageclass"] = { link = "StorageClass" }
	Highlights["@string"] = { link = "TSString" }
	Highlights["@string.escape"] = { link = "TSStringEscape" }
	Highlights["@string.regex"] = { link = "TSStringRegex" }
	Highlights["@string.special"] = { link = "SpecialChar" }
	Highlights["@symbol"] = { link = "TSSymbol" }
	Highlights["@tag"] = { link = "TSTag" }
	Highlights["@tag.attribute"] = { link = "TSAttribute" }
	Highlights["@tag.delimiter"] = { link = "TSTagDelimiter" }
	Highlights["@text"] = { link = "TSText" }
	Highlights["@text.danger"] = { link = "DiagnosticError" }
	Highlights["@text.diff.add"] = { link = "DiffAdd" }
	Highlights["@text.diff.delete"] = { link = "DiffDelete" }
	Highlights["@text.emphasis"] = { link = "TSEmphasis" }
	Highlights["@text.environment"] = { link = "Macro" }
	Highlights["@text.environment.name"] = { link = "Type" }
	Highlights["@text.literal"] = { link = "TSLiteral" }
	Highlights["@text.math"] = { link = "Number" }
	Highlights["@text.note"] = { link = "Tag" }
	Highlights["@text.reference"] = { link = "TSParameterReference" }
	Highlights["@text.strike"] = { link = "TSStrike" }
	Highlights["@text.strong"] = { link = "TSStrong" }
	Highlights["@text.title"] = { link = "TSTitle" }
	Highlights["@text.todo"] = { link = "Todo" }
	Highlights["@text.underline"] = { link = "TSUnderline" }
	Highlights["@text.uri"] = { link = "TSUri" }
	Highlights["@text.warning"] = { link = "DiagnosticWarn" }
	Highlights["@type"] = { link = "TSType" }
	Highlights["@type.builtin"] = { link = "TSTypeBuiltin" }
	Highlights["@type.definition"] = { link = "TSType" }
	Highlights["@type.qualifier"] = { link = "TSType" }
	Highlights["@variable"] = { link = "TSVariable" }
	Highlights["@variable.builtin"] = { link = "TSVariableBuiltin" }
	-- }}}

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
