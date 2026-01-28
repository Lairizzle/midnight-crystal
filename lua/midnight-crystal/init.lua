-- ============================================================================
-- Midnight Crystal
-- ============================================================================

local M = {}

-- ============================================================================
-- PALETTE
-- ============================================================================
M.palette = {
	-- ========================================================================
	-- BACKGROUND COLORS
	-- ========================================================================
	background = "#271224", -- Main editor background (dark purple-black)
	background_alt = "#291E37", -- Floating windows, popups, sidebars, file explorers (slightly lighter purple)

	-- ========================================================================
	-- FOREGROUND / TEXT COLORS
	-- ========================================================================
	foreground = "#C0CAF5", -- Default text color, normal code (bright lavender-white)
	foreground_dim = "#8FB3FF", -- Function names, method names (bright blue)
	foreground_soft = "#9A8FEF", -- Comments, less important text (purple with italic)

	-- ========================================================================
	-- ACCENT COLORS (UI ELEMENTS)
	-- ========================================================================
	accent_primary = "#7DCFFF", -- Operators (+, -, =, .), current line number, selections (bright cyan)
	accent_secondary = "#493961", -- Line numbers, borders, separators (muted purple)
	accent_muted = "#3D355F", -- Visual selection background, inactive elements (dark muted purple)

	-- ========================================================================
	-- KEYWORDS & CONTROL FLOW
	-- ========================================================================
	purple_dark = "#BB9AF7", -- Keywords: if, for, while, function, class, return, public, void, etc. (purple, bold)

	-- ========================================================================
	-- UI DECORATION COLORS
	-- ========================================================================
	indigo_shadow = "#3D355F", -- Shadow effects, inactive backgrounds (same as accent_muted)
	plum_black = "#3B2A46", -- Status line, folded code background (dark plum)
	deep_maroon = "#361B30", -- Current line highlight, tab fills (very dark maroon)

	-- ========================================================================
	-- DIAGNOSTIC / STATUS COLORS
	-- ========================================================================
	error_red = "#F7768E", -- Errors, exceptions, delete operations (bright red)
	warning_yellow = "#E0AF68", -- Warnings, numbers, booleans, constants (warm yellow-orange)
	info_cyan = "#73daca", -- Strings, info messages, added lines (teal-cyan)
	hint_purple = "#BB9AF7", -- Hints, TODOs, macros, preprocessor (purple)

	-- ========================================================================
	-- SEMANTIC SYNTAX COLORS (for code elements)
	-- ========================================================================
	variable_blue = "#89B4FA", -- Variables, identifiers, local vars (light blue)
	parameter_orange = "#FAB387", -- Function parameters, arguments (peach/coral orange)
	property_pink = "#F5C2E7", -- Object properties, fields, attributes (soft pink)
	type_teal = "#2AC3DE", -- Types, classes, interfaces, structs, namespaces (bright teal - high contrast!)
}

-- ============================================================================
-- SETUP FUNCTION
-- ============================================================================
function M.setup(opts)
	opts = opts or {}

	-- Clear existing highlights
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.g.colors_name = "midnight-crystal"
	vim.o.termguicolors = true

	M.load()
end

-- ============================================================================
-- LOAD FUNCTION
-- ============================================================================
function M.load()
	local p = M.palette

	local highlights = {
		-- ========================================================================
		-- EDITOR UI
		-- ========================================================================
		Normal = { fg = p.foreground, bg = p.background },
		NormalFloat = { fg = p.foreground, bg = p.background_alt },
		FloatBorder = { fg = p.accent_secondary, bg = p.background_alt },
		ColorColumn = { bg = p.deep_maroon },
		Conceal = { fg = p.accent_muted },
		Cursor = { fg = p.background, bg = p.foreground },
		lCursor = { fg = p.background, bg = p.foreground },
		CursorIM = { fg = p.background, bg = p.foreground },
		CursorColumn = { bg = p.deep_maroon },
		CursorLine = { bg = p.deep_maroon },
		Directory = { fg = p.info_cyan, bold = true },
		DiffAdd = { bg = "#1a3a2a", fg = p.info_cyan },
		DiffChange = { bg = "#2a2a3a" },
		DiffDelete = { bg = "#3a1a1a", fg = p.error_red },
		DiffText = { bg = "#3a3a5a", bold = true },
		EndOfBuffer = { fg = p.plum_black },
		ErrorMsg = { fg = p.error_red, bold = true },
		VertSplit = { fg = p.accent_secondary },
		WinSeparator = { fg = p.accent_secondary },
		Folded = { fg = p.foreground_dim, bg = p.plum_black },
		FoldColumn = { fg = p.accent_muted, bg = p.background },
		SignColumn = { fg = p.accent_muted, bg = p.background },
		IncSearch = { fg = p.background, bg = p.warning_yellow, bold = true },
		Substitute = { fg = p.background, bg = p.info_cyan },
		LineNr = { fg = p.accent_secondary },
		CursorLineNr = { fg = p.accent_primary, bold = true },
		MatchParen = { fg = p.warning_yellow, bold = true, underline = true },
		ModeMsg = { fg = p.foreground_soft, bold = true },
		MsgArea = { fg = p.foreground },
		MsgSeparator = { fg = p.accent_secondary, bg = p.background },
		MoreMsg = { fg = p.info_cyan, bold = true },
		NonText = { fg = p.accent_muted },
		Pmenu = { fg = p.foreground, bg = p.background_alt },
		PmenuSel = { fg = p.background, bg = p.accent_primary, bold = true },
		PmenuSbar = { bg = p.accent_secondary },
		PmenuThumb = { bg = p.accent_primary },
		Question = { fg = p.info_cyan, bold = true },
		QuickFixLine = { bg = p.accent_muted, bold = true },
		Search = { fg = p.background, bg = p.foreground_soft },
		SpecialKey = { fg = p.accent_muted },
		SpellBad = { sp = p.error_red, undercurl = true },
		SpellCap = { sp = p.warning_yellow, undercurl = true },
		SpellLocal = { sp = p.info_cyan, undercurl = true },
		SpellRare = { sp = p.hint_purple, undercurl = true },
		StatusLine = { fg = p.foreground, bg = p.plum_black, bold = true },
		StatusLineNC = { fg = p.accent_muted, bg = p.deep_maroon },
		TabLine = { fg = p.foreground_dim, bg = p.plum_black },
		TabLineFill = { bg = p.deep_maroon },
		TabLineSel = { fg = p.accent_primary, bg = p.background, bold = true },
		Title = { fg = p.accent_primary, bold = true },
		Visual = { bg = p.accent_muted },
		VisualNOS = { bg = p.accent_muted },
		WarningMsg = { fg = p.warning_yellow, bold = true },
		Whitespace = { fg = p.accent_secondary },
		WildMenu = { fg = p.background, bg = p.accent_primary, bold = true },

		-- ========================================================================
		-- SYNTAX HIGHLIGHTING
		-- ========================================================================
		Comment = { fg = p.foreground_soft, italic = true },

		Constant = { fg = p.warning_yellow },
		String = { fg = p.info_cyan },
		Character = { fg = p.info_cyan },
		Number = { fg = p.warning_yellow },
		Boolean = { fg = p.warning_yellow, bold = true },
		Float = { fg = p.warning_yellow },

		Identifier = { fg = p.variable_blue },
		Function = { fg = p.foreground_dim, bold = true },

		Statement = { fg = p.purple_dark, bold = true },
		Conditional = { fg = p.purple_dark, bold = true },
		Repeat = { fg = p.purple_dark, bold = true },
		Label = { fg = p.purple_dark },
		Operator = { fg = p.accent_primary },
		Keyword = { fg = p.purple_dark, bold = true },
		Exception = { fg = p.error_red, bold = true },

		PreProc = { fg = p.hint_purple },
		Include = { fg = p.hint_purple, bold = true },
		Define = { fg = p.hint_purple },
		Macro = { fg = p.hint_purple },
		PreCondit = { fg = p.hint_purple },

		Type = { fg = p.type_teal },
		StorageClass = { fg = p.purple_dark, bold = true },
		Structure = { fg = p.type_teal },
		Typedef = { fg = p.type_teal },

		Special = { fg = p.accent_primary },
		SpecialChar = { fg = p.warning_yellow },
		Tag = { fg = p.accent_primary },
		Delimiter = { fg = p.foreground },
		SpecialComment = { fg = p.foreground_dim, italic = true, bold = true },
		Debug = { fg = p.error_red },

		Underlined = { underline = true },
		Ignore = { fg = p.accent_muted },
		Error = { fg = p.error_red, bold = true },
		Todo = { fg = p.hint_purple, bold = true, italic = true },

		-- ========================================================================
		-- TREESITTER
		-- ========================================================================
		["@text.literal"] = { fg = p.info_cyan },
		["@text.reference"] = { fg = p.accent_primary },
		["@text.title"] = { fg = p.accent_primary, bold = true },
		["@text.uri"] = { fg = p.info_cyan, underline = true },
		["@text.underline"] = { underline = true },
		["@text.todo"] = { fg = p.hint_purple, bold = true },
		["@text.emphasis"] = { italic = true },
		["@text.strong"] = { bold = true },

		["@comment"] = { fg = p.foreground_soft, italic = true },
		["@punctuation"] = { fg = p.foreground },
		["@punctuation.delimiter"] = { fg = p.foreground },
		["@punctuation.bracket"] = { fg = p.foreground },
		["@punctuation.special"] = { fg = p.accent_primary },

		["@constant"] = { fg = p.warning_yellow },
		["@constant.builtin"] = { fg = p.warning_yellow, bold = true },
		["@constant.macro"] = { fg = p.hint_purple },
		["@define"] = { fg = p.hint_purple },
		["@macro"] = { fg = p.hint_purple },
		["@string"] = { fg = p.info_cyan },
		["@string.escape"] = { fg = p.warning_yellow },
		["@string.special"] = { fg = p.warning_yellow },
		["@character"] = { fg = p.info_cyan },
		["@character.special"] = { fg = p.warning_yellow },
		["@number"] = { fg = p.warning_yellow },
		["@boolean"] = { fg = p.warning_yellow, bold = true },
		["@float"] = { fg = p.warning_yellow },

		["@function"] = { fg = p.foreground_dim, bold = true },
		["@function.builtin"] = { fg = p.foreground_dim, bold = true },
		["@function.call"] = { fg = p.foreground_dim },
		["@function.macro"] = { fg = p.hint_purple },
		["@function.method"] = { fg = p.foreground_dim, bold = true },
		["@function.method.call"] = { fg = p.foreground_dim },
		["@parameter"] = { fg = p.parameter_orange },
		["@method"] = { fg = p.foreground_dim, bold = true },
		["@method.call"] = { fg = p.foreground_dim },
		["@field"] = { fg = p.property_pink },
		["@property"] = { fg = p.property_pink },
		["@attribute"] = { fg = p.property_pink },
		["@attribute.builtin"] = { fg = p.hint_purple },
		["@constructor"] = { fg = p.foreground_dim, bold = true },

		["@conditional"] = { fg = p.purple_dark, bold = true },
		["@repeat"] = { fg = p.purple_dark, bold = true },
		["@label"] = { fg = p.purple_dark },
		["@operator"] = { fg = p.accent_primary },
		["@keyword"] = { fg = p.purple_dark, bold = true },
		["@keyword.function"] = { fg = p.purple_dark, bold = true },
		["@keyword.operator"] = { fg = p.purple_dark, bold = true },
		["@keyword.return"] = { fg = p.purple_dark, bold = true },
		["@keyword.coroutine"] = { fg = p.purple_dark, bold = true },
		["@keyword.import"] = { fg = p.hint_purple, bold = true },
		["@exception"] = { fg = p.error_red, bold = true },

		["@variable"] = { fg = p.variable_blue },
		["@variable.builtin"] = { fg = p.warning_yellow },
		["@variable.parameter"] = { fg = p.parameter_orange },
		["@variable.member"] = { fg = p.property_pink },

		["@type"] = { fg = p.type_teal },
		["@type.definition"] = { fg = p.type_teal },
		["@type.builtin"] = { fg = p.type_teal, bold = true },
		["@type.qualifier"] = { fg = p.purple_dark, bold = true },
		["@storageclass"] = { fg = p.purple_dark, bold = true },

		["@module"] = { fg = p.type_teal },
		["@module.builtin"] = { fg = p.type_teal, bold = true },
		["@namespace"] = { fg = p.type_teal },

		["@include"] = { fg = p.hint_purple, bold = true },
		["@preproc"] = { fg = p.hint_purple },
		["@debug"] = { fg = p.error_red },

		["@tag"] = { fg = p.accent_primary },
		["@tag.attribute"] = { fg = p.foreground_soft },
		["@tag.delimiter"] = { fg = p.foreground },

		-- Markup (for markdown, etc.)
		["@markup.heading"] = { fg = p.accent_primary, bold = true },
		["@markup.heading.1"] = { fg = p.accent_primary, bold = true },
		["@markup.heading.2"] = { fg = p.accent_primary, bold = true },
		["@markup.heading.3"] = { fg = p.foreground_soft, bold = true },
		["@markup.heading.4"] = { fg = p.foreground_soft, bold = true },
		["@markup.heading.5"] = { fg = p.foreground_soft },
		["@markup.heading.6"] = { fg = p.foreground_soft },
		["@markup.list"] = { fg = p.accent_primary },
		["@markup.list.checked"] = { fg = p.info_cyan },
		["@markup.list.unchecked"] = { fg = p.foreground_dim },
		["@markup.emphasis"] = { italic = true },
		["@markup.strong"] = { bold = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },
		["@markup.italic"] = { italic = true },
		["@markup.quote"] = { fg = p.foreground_dim, italic = true },
		["@markup.link"] = { fg = p.foreground_soft, underline = true },
		["@markup.link.url"] = { fg = p.info_cyan, underline = true },
		["@markup.link.label"] = { fg = p.foreground_soft },
		["@markup.raw"] = { fg = p.info_cyan },
		["@markup.raw.block"] = { fg = p.info_cyan },
		["@markup.math"] = { fg = p.warning_yellow },

		-- Diff
		["@diff.plus"] = { fg = p.info_cyan },
		["@diff.minus"] = { fg = p.error_red },
		["@diff.delta"] = { fg = p.warning_yellow },
		-- ========================================================================
		-- LSP
		-- ========================================================================
		LspReferenceText = { bg = p.accent_muted },
		LspReferenceRead = { bg = p.accent_muted },
		LspReferenceWrite = { bg = p.accent_muted },

		DiagnosticError = { fg = p.error_red },
		DiagnosticWarn = { fg = p.warning_yellow },
		DiagnosticInfo = { fg = p.info_cyan },
		DiagnosticHint = { fg = p.hint_purple },

		DiagnosticVirtualTextError = { fg = p.error_red, italic = true },
		DiagnosticVirtualTextWarn = { fg = p.warning_yellow, italic = true },
		DiagnosticVirtualTextInfo = { fg = p.info_cyan, italic = true },
		DiagnosticVirtualTextHint = { fg = p.hint_purple, italic = true },

		DiagnosticUnderlineError = { sp = p.error_red, undercurl = true },
		DiagnosticUnderlineWarn = { sp = p.warning_yellow, undercurl = true },
		DiagnosticUnderlineInfo = { sp = p.info_cyan, undercurl = true },
		DiagnosticUnderlineHint = { sp = p.hint_purple, undercurl = true },

		LspSignatureActiveParameter = { fg = p.warning_yellow, bold = true },
		LspCodeLens = { fg = p.foreground_dim, italic = true },

		-- ========================================================================
		-- LSP SEMANTIC TOKENS (Proper linking approach)
		-- ========================================================================
		-- Link to Treesitter groups for consistency
		["@lsp.type.boolean"] = { link = "@boolean" },
		["@lsp.type.builtinType"] = { link = "@type.builtin" },
		["@lsp.type.comment"] = { link = "@comment" },
		["@lsp.type.decorator"] = { link = "@function" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.escapeSequence"] = { link = "@string.escape" },
		["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
		["@lsp.type.interface"] = { fg = p.type_teal },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.namespace"] = { link = "@module" },
		["@lsp.type.number"] = { link = "@number" },
		["@lsp.type.operator"] = { link = "@operator" },
		["@lsp.type.parameter"] = { fg = p.parameter_orange },
		["@lsp.type.property"] = { fg = p.property_pink },
		["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.string"] = { link = "@string" },
		["@lsp.type.typeAlias"] = { link = "@type.definition" },
		["@lsp.type.unresolvedReference"] = { undercurl = true, sp = p.error_red },
		["@lsp.type.variable"] = { fg = p.variable_blue }, -- EXPLICIT color instead of {}
		["@lsp.type.function"] = { fg = p.foreground_dim, bold = true },
		["@lsp.type.method"] = { fg = p.foreground_dim, bold = true },
		["@lsp.type.struct"] = { fg = p.type_teal },
		["@lsp.type.type"] = { fg = p.type_teal },
		["@lsp.type.typeParameter"] = { fg = p.type_teal },
		["@lsp.type.class"] = { fg = p.type_teal },
		["@lsp.type.field"] = { fg = p.property_pink },
		["@lsp.type.event"] = { fg = p.warning_yellow },
		["@lsp.type.macro"] = { link = "@macro" },

		-- Type modifiers
		["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
		["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
		["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"] = { link = "@operator" },
		["@lsp.typemod.string.injected"] = { link = "@string" },
		["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.typeAlias.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.variable.callable"] = { link = "@function" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"] = { link = "@variable" },
		["@lsp.typemod.variable.static"] = { link = "@constant" },
		["@lsp.typemod.variable.readonly"] = { link = "@constant" },
		["@lsp.typemod.property.readonly"] = { fg = p.property_pink, italic = true },
		["@lsp.typemod.function.readonly"] = { link = "@function" },
		["@lsp.typemod.method.readonly"] = { link = "@method" },

		-- Modifiers (applied on top of base styles)
		["@lsp.mod.readonly"] = {},
		["@lsp.mod.static"] = {},
		["@lsp.mod.deprecated"] = { strikethrough = true },
		["@lsp.mod.abstract"] = {},
		["@lsp.mod.async"] = {},
		["@lsp.mod.declaration"] = {},
		["@lsp.mod.definition"] = {},
		["@lsp.mod.documentation"] = {},

		-- ========================================================================
		-- GIT SIGNS
		-- ========================================================================
		GitSignsAdd = { fg = p.info_cyan },
		GitSignsChange = { fg = p.warning_yellow },
		GitSignsDelete = { fg = p.error_red },
		GitSignsAddNr = { fg = p.info_cyan },
		GitSignsChangeNr = { fg = p.warning_yellow },
		GitSignsDeleteNr = { fg = p.error_red },
		GitSignsAddLn = { bg = "#1a3a2a" },
		GitSignsChangeLn = { bg = "#2a2a3a" },
		GitSignsDeleteLn = { bg = "#3a1a1a" },

		-- ========================================================================
		-- TELESCOPE
		-- ========================================================================
		TelescopeBorder = { fg = p.accent_secondary, bg = p.background_alt },
		TelescopeNormal = { fg = p.foreground, bg = p.background_alt },
		TelescopePromptBorder = { fg = p.accent_primary, bg = p.background_alt },
		TelescopePromptNormal = { fg = p.foreground, bg = p.background_alt },
		TelescopePromptPrefix = { fg = p.accent_primary, bold = true },
		TelescopeSelection = { fg = p.foreground, bg = p.accent_muted, bold = true },
		TelescopeSelectionCaret = { fg = p.accent_primary, bold = true },
		TelescopeMultiSelection = { fg = p.hint_purple },
		TelescopeMatching = { fg = p.warning_yellow, bold = true },
		TelescopePromptTitle = { fg = p.background, bg = p.accent_primary, bold = true },
		TelescopeResultsTitle = { fg = p.background, bg = p.foreground_soft, bold = true },
		TelescopePreviewTitle = { fg = p.background, bg = p.info_cyan, bold = true },

		-- ========================================================================
		-- NVIM-TREE
		-- ========================================================================
		NvimTreeNormal = { fg = p.foreground, bg = p.background_alt },
		NvimTreeNormalNC = { fg = p.foreground, bg = p.background_alt },
		NvimTreeRootFolder = { fg = p.accent_primary, bold = true },
		NvimTreeFolderName = { fg = p.type_teal },
		NvimTreeFolderIcon = { fg = p.accent_primary },
		NvimTreeEmptyFolderName = { fg = p.foreground_dim },
		NvimTreeOpenedFolderName = { fg = p.type_teal, bold = true },
		NvimTreeSymlink = { fg = p.info_cyan },
		NvimTreeExecFile = { fg = p.warning_yellow, bold = true },
		NvimTreeOpenedFile = { fg = p.foreground, bold = true },
		NvimTreeSpecialFile = { fg = p.hint_purple },
		NvimTreeImageFile = { fg = p.foreground },
		NvimTreeIndentMarker = { fg = p.accent_secondary },
		NvimTreeGitDirty = { fg = p.warning_yellow },
		NvimTreeGitStaged = { fg = p.info_cyan },
		NvimTreeGitMerge = { fg = p.hint_purple },
		NvimTreeGitRenamed = { fg = p.warning_yellow },
		NvimTreeGitNew = { fg = p.info_cyan },
		NvimTreeGitDeleted = { fg = p.error_red },

		-- ========================================================================
		-- WHICH-KEY
		-- ========================================================================
		WhichKey = { fg = p.accent_primary, bold = true },
		WhichKeyGroup = { fg = p.foreground_soft },
		WhichKeyDesc = { fg = p.foreground },
		WhichKeySeparator = { fg = p.accent_muted },
		WhichKeyFloat = { bg = p.background_alt },
		WhichKeyBorder = { fg = p.accent_secondary, bg = p.background_alt },

		-- ========================================================================
		-- NVIM-CMP
		-- ========================================================================
		CmpItemAbbrDeprecated = { fg = p.accent_muted, strikethrough = true },
		CmpItemAbbrMatch = { fg = p.accent_primary, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = p.accent_primary },
		CmpItemKindVariable = { fg = p.variable_blue },
		CmpItemKindInterface = { fg = p.type_teal },
		CmpItemKindText = { fg = p.foreground },
		CmpItemKindFunction = { fg = p.foreground_dim },
		CmpItemKindMethod = { fg = p.foreground_dim },
		CmpItemKindKeyword = { fg = p.purple_dark },
		CmpItemKindProperty = { fg = p.property_pink },
		CmpItemKindUnit = { fg = p.warning_yellow },
		CmpItemKindClass = { fg = p.type_teal },
		CmpItemKindConstant = { fg = p.warning_yellow },
		CmpItemKindSnippet = { fg = p.hint_purple },
		CmpItemKindEnum = { fg = p.type_teal },
		CmpItemKindStruct = { fg = p.type_teal },
		CmpItemKindValue = { fg = p.warning_yellow },
		CmpItemKindField = { fg = p.property_pink },
		CmpItemKindModule = { fg = p.type_teal },

		-- ========================================================================
		-- INDENT-BLANKLINE
		-- ========================================================================
		IndentBlanklineChar = { fg = p.accent_secondary },
		IndentBlanklineContextChar = { fg = p.accent_primary },
		IndentBlanklineContextStart = { sp = p.accent_primary, underline = true },

		-- ========================================================================
		-- NEOGIT
		-- ========================================================================
		NeogitBranch = { fg = p.hint_purple, bold = true },
		NeogitRemote = { fg = p.foreground_soft, bold = true },
		NeogitHunkHeader = { fg = p.foreground, bg = p.accent_muted },
		NeogitHunkHeaderHighlight = { fg = p.accent_primary, bg = p.accent_muted, bold = true },
		NeogitDiffAdd = { fg = p.info_cyan },
		NeogitDiffDelete = { fg = p.error_red },
		NeogitDiffContext = { fg = p.foreground_dim },
		NeogitNotificationInfo = { fg = p.info_cyan },
		NeogitNotificationWarning = { fg = p.warning_yellow },
		NeogitNotificationError = { fg = p.error_red },

		-- ========================================================================
		-- DASHBOARD / ALPHA
		-- ========================================================================
		DashboardHeader = { fg = p.accent_primary, bold = true },
		DashboardCenter = { fg = p.foreground_soft },
		DashboardShortcut = { fg = p.hint_purple, bold = true },
		DashboardFooter = { fg = p.foreground_dim, italic = true },

		AlphaHeader = { fg = p.accent_primary, bold = true },
		AlphaButtons = { fg = p.foreground_soft },
		AlphaShortcut = { fg = p.hint_purple, bold = true },
		AlphaFooter = { fg = p.foreground_dim, italic = true },

		-- ========================================================================
		-- BUFFERLINE
		-- ========================================================================
		BufferLineFill = { bg = p.deep_maroon },
		BufferLineBackground = { fg = p.foreground_dim, bg = p.plum_black },
		BufferLineBufferSelected = { fg = p.accent_primary, bg = p.background, bold = true },
		BufferLineBufferVisible = { fg = p.foreground, bg = p.plum_black },
		BufferLineCloseButton = { fg = p.foreground_dim, bg = p.plum_black },
		BufferLineCloseButtonSelected = { fg = p.error_red, bg = p.background, bold = true },
		BufferLineCloseButtonVisible = { fg = p.foreground_dim, bg = p.plum_black },
		BufferLineModified = { fg = p.warning_yellow, bg = p.plum_black },
		BufferLineModifiedSelected = { fg = p.warning_yellow, bg = p.background },
		BufferLineModifiedVisible = { fg = p.warning_yellow, bg = p.plum_black },

		-- ========================================================================
		-- NOTIFY
		-- ========================================================================
		NotifyERRORBorder = { fg = p.error_red },
		NotifyWARNBorder = { fg = p.warning_yellow },
		NotifyINFOBorder = { fg = p.info_cyan },
		NotifyDEBUGBorder = { fg = p.foreground_dim },
		NotifyTRACEBorder = { fg = p.hint_purple },
		NotifyERRORIcon = { fg = p.error_red },
		NotifyWARNIcon = { fg = p.warning_yellow },
		NotifyINFOIcon = { fg = p.info_cyan },
		NotifyDEBUGIcon = { fg = p.foreground_dim },
		NotifyTRACEIcon = { fg = p.hint_purple },
		NotifyERRORTitle = { fg = p.error_red, bold = true },
		NotifyWARNTitle = { fg = p.warning_yellow, bold = true },
		NotifyINFOTitle = { fg = p.info_cyan, bold = true },
		NotifyDEBUGTitle = { fg = p.foreground_dim, bold = true },
		NotifyTRACETitle = { fg = p.hint_purple, bold = true },

		-- ========================================================================
		-- NOICE
		-- ========================================================================
		NoiceCmdlinePopup = { fg = p.foreground, bg = p.background_alt },
		NoiceCmdlinePopupBorder = { fg = p.accent_secondary, bg = p.background_alt },
		NoiceCmdlineIcon = { fg = p.accent_primary, bold = true },
		NoiceCmdlinePrompt = { fg = p.accent_primary, bold = true },
		NoiceConfirm = { fg = p.foreground, bg = p.background_alt },
		NoiceConfirmBorder = { fg = p.accent_secondary, bg = p.background_alt },

		-- ========================================================================
		-- MARKDOWN
		-- ========================================================================
		markdownHeadingDelimiter = { fg = p.accent_primary, bold = true },
		markdownH1 = { fg = p.accent_primary, bold = true },
		markdownH2 = { fg = p.accent_primary, bold = true },
		markdownH3 = { fg = p.foreground_soft, bold = true },
		markdownH4 = { fg = p.foreground_soft, bold = true },
		markdownH5 = { fg = p.foreground_soft },
		markdownH6 = { fg = p.foreground_soft },
		markdownCode = { fg = p.info_cyan, bg = p.plum_black },
		markdownCodeBlock = { fg = p.info_cyan },
		markdownCodeDelimiter = { fg = p.accent_muted },
		markdownBlockquote = { fg = p.foreground_dim, italic = true },
		markdownListMarker = { fg = p.accent_primary, bold = true },
		markdownOrderedListMarker = { fg = p.accent_primary, bold = true },
		markdownRule = { fg = p.accent_muted },
		markdownLinkText = { fg = p.foreground_soft, underline = true },
		markdownUrl = { fg = p.info_cyan, underline = true },
		markdownBold = { bold = true },
		markdownItalic = { italic = true },
	}

	-- Apply all highlights (convert string links to proper tables like TokyoNight)
	for group, settings in pairs(highlights) do
		-- Convert string links to link tables
		if type(settings) == "string" then
			settings = { link = settings }
		end
		vim.api.nvim_set_hl(0, group, settings)
	end
end

return M
