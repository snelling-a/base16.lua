-- vim:foldmethod=marker:foldlevel=0:foldlevelstart=0
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
	Highlights.CurSearch = { link = "Search" }
	Highlights.Cursor = { fg = colors.base00, bg = colors.base05 }
	Highlights.CursorColumn = { link = "CursorLine" }
	Highlights.CursorLine = { bg = colors.base01 }
	Highlights.CursorLineNr = { fg = colors.base06, bg = colors.base01 }
	Highlights.Debug = { fg = colors.base08 }
	Highlights.Directory = { fg = colors.base0D }
	Highlights.Error = { fg = colors.base00, bg = colors.base08 }
	Highlights.ErrorMsg = { fg = colors.base08 }
	Highlights.Exception = { fg = colors.base08 }
	Highlights.FoldColumn = { fg = colors.base0C }
	Highlights.Folded = { fg = colors.base03, bg = colors.base01 }
	Highlights.FoldedText = { link = "TSComment" }
	Highlights.IncSearch = { fg = colors.base01, bg = colors.base09 }
	Highlights.Italic = { italic = true }
	Highlights.LineNr = { fg = colors.base04 }
	Highlights.Macro = { fg = colors.base08 }
	Highlights.MatchParen = { bg = colors.base03 }
	Highlights.ModeMsg = { fg = colors.base0B, bg = nil }
	Highlights.MoreMsg = { link = "ModeMsg" }
	Highlights.NonText = { fg = colors.base03 }
	Highlights.Normal = { fg = colors.base05, bg = colors.base00 }
	Highlights.PMenu = { fg = colors.base05 }
	Highlights.PMenuSel = { fg = colors.base01, bg = colors.base05 }
	Highlights.Question = { fg = colors.base0D }
	Highlights.QuickFixLine = { link = "CursorLine" }
	Highlights.RulerFormat = { fg = colors.base0D }
	Highlights.Search = { fg = colors.base01, bg = colors.base0A }
	Highlights.SignColumn = { fg = colors.base04 }
	Highlights.SpecialKey = { fg = colors.base03 }
	Highlights.StatusLine = { fg = colors.base05, bg = colors.base02 }
	Highlights.StatusLineNC = { fg = colors.base04 }
	Highlights.Substitute = { fg = colors.base01, bg = colors.base0A }
	Highlights.TabLine = { link = "StatusLineNC" }
	Highlights.TabLineFill = { link = "StatusLineNC" }
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
	Highlights.Delimiter = { fg = colors.base05 }
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
	Highlights.Added = { fg = colors.base0B }
	Highlights.Changed = { fg = colors.base0E }
	Highlights.DiffAdd = { link = "Added" }
	Highlights.DiffAdded = { link = "DiffAdd" }
	Highlights.DiffChange = { fg = colors.base0E }
	Highlights.DiffDelete = { link = "Removed" }
	Highlights.DiffFile = { fg = colors.base08 }
	Highlights.DiffLine = { fg = colors.base0E }
	Highlights.DiffNewFile = { fg = colors.base0B }
	Highlights.DiffRemoved = { link = "DiffDelete" }
	Highlights.DiffText = { fg = colors.base0D }
	Highlights.Removed = { fg = colors.base08 }
	-- }}}

	-- Git commit highlighting {{{
	Highlights.gitcommitOverflow = { link = "ErrorMsg" }
	Highlights.gitcommitSummary = { fg = colors.base0B }
	Highlights.gitcommitComment = { link = "Comment" }
	Highlights.gitcommitUntracked = { link = "NonText" }
	Highlights.gitcommitDiscarded = { fg = colors.base08 }
	Highlights.gitcommitSelected = { fg = colors.base02 }
	Highlights.gitcommitHeader = { link = "Title" }
	Highlights.gitcommitSelectedType = { fg = colors.base0D }
	Highlights.gitcommitUnmergedType = { fg = colors.base0D }
	Highlights.gitcommitDiscardedType = { fg = colors.base0D }
	Highlights.gitcommitBranch = { fg = colors.base0E, bold = true }
	Highlights.gitcommitUntrackedFile = { link = "NonText" }
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
	Highlights.DiagnosticUnderlineWarning = { link = "DiagnosticUnderlineWarn" }
	Highlights.DiagnosticWarn = { fg = colors.base0E }
	-- }}}

	-- DAP {{{
	Highlights.Breakpoint = { link = "DiagnosticError" }
	Highlights.BreakpointCondition = { link = "DiagnosticUnderlineWarn" }
	Highlights.BreakpointRejected = { link = "DiagnosticUnderlineError" }
	Highlights.LogPoint = { link = "DiagnosticHint" }
	Highlights.Stopped = { link = "DiagnosticError" }
	-- }}}

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

	--- RAINBOW-DELIMETERS {{{
	Highlights.RainbowDelimiterRed = { fg = colors.base08 }
	Highlights.RainbowDelimiterYellow = { fg = colors.base0A }
	Highlights.RainbowDelimiterBlue = { fg = colors.base0D }
	Highlights.RainbowDelimiterOrange = { fg = colors.base09 }
	Highlights.RainbowDelimiterGreen = { fg = colors.base0B }
	Highlights.RainbowDelimiterViolet = { fg = colors.base0E }
	Highlights.RainbowDelimiterCyan = { fg = colors.base0C }
	--- }}}

	-- Treesitter {{{
	Highlights.TSAnnotation = { fg = colors.base0F }
	Highlights.TSAttribute = { fg = colors.base0D, italic = true }
	Highlights.TSBoolean = { link = "Boolean" }
	Highlights.TSCharacter = { link = "Character" }
	Highlights.TSComment = { fg = colors.base03, italic = true }
	Highlights.TSConditional = { link = "Conditional" }
	Highlights.TSConstBuiltin = { fg = colors.base09, italic = true }
	Highlights.TSConstMacro = { fg = colors.base08 }
	Highlights.TSConstant = { link = "Constant" }
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
	Highlights.TSItalic = { link = "Italic" }
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
	Highlights.TSPunctBracket = { fg = colors.base0F }
	Highlights.TSPunctDelimiter = { fg = colors.base0F }
	Highlights.TSPunctSpecial = { fg = colors.base05 }
	Highlights.TSRepeat = { link = "Repeat" }
	Highlights.TSStrike = { fg = colors.base0F, strikethrough = true }
	Highlights.TSString = { link = "String" }
	Highlights.TSStringEscape = { fg = colors.base0C }
	Highlights.TSStringRegex = { fg = colors.base0C }
	Highlights.TSStrong = { link = "Bold" }
	Highlights.TSSymbol = { fg = colors.base0B }
	Highlights.TSTag = { link = "Tag" }
	Highlights.TSTagDelimiter = { fg = colors.base0F }
	Highlights.TSText = { fg = colors.base05 }
	Highlights.TSTitle = { fg = colors.base0D, bold = true }
	Highlights.TSType = { link = "Type" }
	Highlights.TSTypeBuiltin = { fg = colors.base0A, italic = true }
	Highlights.TSURI = { fg = colors.base09, underline = true }
	Highlights.TSUnderline = { fg = colors.base03, sp = colors.base03, underline = true }
	Highlights.TSVariable = { fg = colors.base08 }
	Highlights.TSVariableBuiltin = { fg = colors.base08, italic = true }

	Highlights.gitcommitSummary = { fg = colors.base0B, italic = true }
	Highlights.zshKSHFunction = { link = "TSFunction" }
	Highlights["@attribute"] = { link = "TSAttribute" }
	Highlights["@boolean"] = { link = "TSBoolean" }
	Highlights["@character"] = { link = "TSCharacter" }
	Highlights["@character.special"] = { link = "SpecialChar" }
	Highlights["@comment"] = { link = "TSComment" }
	Highlights["@comment.error"] = { link = "TSError" }
	Highlights["@comment.note"] = { link = "Tag" }
	Highlights["@comment.todo"] = { link = "Todo" }
	Highlights["@comment.warning"] = { link = "DiagnosticWarn" }
	Highlights["@constant"] = { link = "TSConstant" }
	Highlights["@constant.builtin"] = { link = "TSConstant" }
	Highlights["@constant.java"] = { fg = colors.base0C }
	Highlights["@constant.macro"] = { link = "TSConstant" }
	Highlights["@constructor"] = { link = "TSConstructor" }
	Highlights["@constructor.lua"] = { link = "TSConstructor" }
	Highlights["@constructor.tsx"] = { link = "@constructor.typescript" }
	Highlights["@constructor.typescript"] = { link = "TSConstructor" }
	Highlights["@diff.delta"] = { link = "DiffChanged" }
	Highlights["@diff.minus"] = { link = "DiffDelete" }
	Highlights["@diff.plus"] = { link = "DiffAdd" }
	Highlights["@error"] = { link = "Error" }
	Highlights["@function"] = { link = "TSFunction" }
	Highlights["@function.builtin"] = { link = "TSFuncBuiltin" }
	Highlights["@function.builtin.bash"] = { fg = colors.base08, italic = true }
	Highlights["@function.call"] = { link = "TSFunction" }
	Highlights["@function.macro"] = { link = "TSFuncMacro" }
	Highlights["@function.method"] = { link = "TSMethod" }
	Highlights["@function.method.call"] = { link = "TSMethod" }
	Highlights["@function.method.call.php"] = { link = "TSFunction" }
	Highlights["@function.method.php"] = { link = "TSFunction" }
	Highlights["@keyword"] = { link = "TSKeyword" }
	Highlights["@keyword.conditional"] = { link = "TSConditional" }
	Highlights["@keyword.debug"] = { link = "Debug" }
	Highlights["@keyword.directive"] = { link = "PreProc" }
	Highlights["@keyword.directive.define"] = { link = "Define" }
	Highlights["@keyword.exception"] = { link = "TSException" }
	Highlights["@keyword.export"] = { link = "TSKeyword" }
	Highlights["@keyword.function"] = { link = "TSKeywordFunction" }
	Highlights["@keyword.import"] = { link = "TSInclude" }
	Highlights["@keyword.operator"] = { link = "TSKeywordOperator" }
	Highlights["@keyword.repeat"] = { link = "TSRepeat" }
	Highlights["@keyword.return"] = { link = "TSKeyword" }
	Highlights["@keyword.storage"] = { link = "StorageClass" }
	Highlights["@label"] = { link = "TSLabel" }
	Highlights["@label.json"] = { link = "TSLabel" }
	Highlights["@markup"] = { link = "TSText" }
	Highlights["@markup.environment"] = { link = "Macro" }
	Highlights["@markup.environment.name"] = { link = "Type" }
	Highlights["@markup.heading"] = { link = "TSTitle" }
	Highlights["@markup.heading.1.markdown"] = { fg = colors.base08 }
	Highlights["@markup.heading.2.markdown"] = { fg = colors.base0A }
	Highlights["@markup.heading.3.markdown"] = { fg = colors.base0D }
	Highlights["@markup.heading.4.markdown"] = { fg = colors.base09 }
	Highlights["@markup.heading.5.markdown"] = { fg = colors.base0B }
	Highlights["@markup.heading.6.markdown"] = { fg = colors.base0E }
	Highlights["@markup.italic"] = { link = "TSEmphasis" }
	Highlights["@markup.link"] = { fg = colors.base08 }
	Highlights["@markup.link.url"] = { link = "TSUri" }
	Highlights["@markup.list"] = { link = "Special" }
	Highlights["@markup.list.checked"] = { link = "DiagnosticOk" }
	Highlights["@markup.list.unchecked"] = { link = "DiagnosticInfo" }
	Highlights["@markup.raw"] = { link = "Number" }
	Highlights["@markup.strikethrough"] = { link = "TSStrike" }
	Highlights["@markup.strong"] = { link = "TSStrong" }
	Highlights["@markup.underline"] = { link = "TSUnderline" }
	Highlights["@module"] = { fg = colors.base05, italic = true }
	Highlights["@number"] = { link = "TSNumber" }
	Highlights["@number.css"] = { link = "TSNumber" }
	Highlights["@number.float"] = { link = "TSFloat" }
	Highlights["@operator"] = { link = "TSOperator" }
	Highlights["@property"] = { link = "TSProperty" }
	Highlights["@property.class.css"] = { link = "StorageClass" }
	Highlights["@property.cpp"] = { link = "TSProperty" }
	Highlights["@property.css"] = { link = "TSProperty" }
	Highlights["@property.id.css"] = { link = "Identifier" }
	Highlights["@property.toml"] = { link = "TSProperty" }
	Highlights["@property.typescript"] = { link = "TSProperty" }
	Highlights["@punctuation.bracket"] = { link = "TSPunctBracket" }
	Highlights["@punctuation.delimiter"] = { link = "TSPunctDelimiter" }
	Highlights["@punctuation.special"] = { link = "Special" }
	Highlights["@string"] = { link = "TSString" }
	Highlights["@string.escape"] = { link = "TSStringEscape" }
	Highlights["@string.plain.css"] = { link = "TSString" }
	Highlights["@string.regexp"] = { link = "TSStringRegex" }
	Highlights["@string.special"] = { link = "Special" }
	Highlights["@string.special.symbol"] = { link = "TSSymbol" }
	Highlights["@string.special.symbol.ruby"] = { link = "Special" }
	Highlights["@string.special.url"] = { link = "SpecialChar" }
	Highlights["@tag"] = { link = "TSTag" }
	Highlights["@tag.attribute"] = { link = "TSAttribute" }
	Highlights["@tag.attribute.tsx"] = { link = "TSAttribute" }
	Highlights["@tag.delimiter"] = { link = "TSTagDelimiter" }
	Highlights["@type"] = { link = "TSType" }
	Highlights["@type.builtin"] = { link = "TSTypeBuiltin" }
	Highlights["@type.builtin.c"] = { link = "TSVariableBuiltin" }
	Highlights["@type.builtin.cpp"] = { link = "TSVariableBuiltin" }
	Highlights["@type.css"] = { link = "TSType" }
	Highlights["@type.definition"] = { link = "TSType" }
	Highlights["@type.qualifier"] = { link = "TSKeyword" }
	Highlights["@type.tag.css"] = { link = "TSTag" }
	Highlights["@variable"] = { link = "TSVariable" }
	Highlights["@variable.builtin"] = { link = "TSVariableBuiltin" }
	Highlights["@variable.member"] = { link = "TSField" }
	Highlights["@variable.member.yaml"] = { link = "Constant" }
	Highlights["@variable.parameter"] = { link = "TSParameter" }

	-- Legacy Highlights {{{
	Highlights["@conditional"] = { link = "@keyword.conditional" }
	Highlights["@define"] = { link = "@keyword.directive.define" }
	Highlights["@field"] = { link = "@variable.member" }
	Highlights["@float"] = { link = "number.float" }
	Highlights["@include"] = { link = "@keyword.import" }
	Highlights["@method"] = { link = "@function.method" }
	Highlights["@method.call"] = { link = "@function.method.call" }
	Highlights["@method.call.php"] = { link = "@function.method.call.php" }
	Highlights["@method.php"] = { link = "@function.method.php" }
	Highlights["@namespace"] = { link = "@module" }
	Highlights["@parameter"] = { link = "@variable.parameter" }
	Highlights["@preproc"] = { link = "@keyword.directive" }
	Highlights["@repeat"] = { link = "@keyword.repeat" }
	Highlights["@storageclass"] = { link = "@keyword.storage" }
	Highlights["@string.regex"] = { link = "@string.regexp" }
	Highlights["@symbol"] = { link = "@string.special.symbol" }
	Highlights["@symbol.ruby"] = { link = "@string.special.symbol.ruby" }
	Highlights["@text"] = { link = "@markup" }
	Highlights["@text.danger"] = { link = "comment.error" }
	Highlights["@text.diff.add"] = { link = "@diff.plus" }
	Highlights["@text.diff.delete"] = { link = "@diff.minus" }
	Highlights["@text.emphasis"] = { link = "@markup.italic" }
	Highlights["@text.environment"] = { link = "@markup.environment" }
	Highlights["@text.environment.name"] = { link = "@markup.environment.name" }
	Highlights["@text.literal"] = { link = "@markup.raw" }
	Highlights["@text.math"] = { link = "@markup.math" }
	Highlights["@text.note"] = { link = "comment.note" }
	Highlights["@text.reference"] = { link = "@markup.link" }
	Highlights["@text.strike"] = { link = "@markup.strikethrough" }
	Highlights["@text.strong"] = { link = "@markup.strong" }
	Highlights["@text.title"] = { link = "@markup.heading" }
	Highlights["@text.title.1.markdown"] = { link = "@markup.heading.1.markdown" }
	Highlights["@text.title.2.markdown"] = { link = "@markup.heading.2.markdown" }
	Highlights["@text.title.3.markdown"] = { link = "@markup.heading.3.markdown" }
	Highlights["@text.title.4.markdown"] = { link = "@markup.heading.4.markdown" }
	Highlights["@text.title.5.markdown"] = { link = "@markup.heading.5.markdown" }
	Highlights["@text.title.6.markdown"] = { link = "@markup.heading.6.markdown" }
	Highlights["@text.todo"] = { link = "comment.warning" }
	Highlights["@text.todo.checked"] = { link = "@markup.list.checked" }
	Highlights["@text.todo.unchecked"] = { link = "@markup.list.unchecked" }
	Highlights["@text.underline"] = { link = "@markup.underline" }
	Highlights["@text.uri"] = { link = "@markup.link.url" }
	Highlights["@text.warning"] = { link = "comment.warning" }
	Highlights["@variable.member.yaml"] = { link = "@field.yaml" }
	Highlights["exception"] = { link = "@keyword.exception" }
	Highlights["text.uri"] = { link = "@markup.link.uri" }
	-- }}}

	-- {{{
	Highlights.TreesitterContext = { link = "Visual" }
	Highlights.TreesitterContextBottom = { sp = colors.base05, underline = true }
	-- }}}

	-- }}}
	-- User {{{
	Highlights.User1 = { fg = colors.base08, bg = colors.base02 }
	Highlights.User2 = { fg = colors.base0E, bg = colors.base02 }
	Highlights.User3 = { fg = colors.base05, bg = colors.base02 }
	Highlights.User4 = { fg = colors.base0C, bg = colors.base02 }
	Highlights.User5 = { fg = colors.base05, bg = colors.base02 }
	Highlights.User6 = { fg = colors.base05, bg = colors.base01 }
	Highlights.User7 = { fg = colors.base05, bg = colors.base02 }
	Highlights.User8 = { fg = colors.base00, bg = colors.base02 }
	Highlights.User9 = { fg = colors.base00, bg = colors.base02 }
	-- }}}

	-- }}}

	Highlights.IndentBlanklineChar = { fg = colors.base02 }
	Highlights.IndentBlanklineContextChar = { fg = colors.base04 }

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

	Highlights.MiniCompletionActiveParameter = "CursorLine"

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
