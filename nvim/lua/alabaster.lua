vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "alabaster"

local theme
---@diagnostic disable: undefined-global
-- terminal colors
vim.g.terminal_color_0 = "#000000"
vim.g.terminal_color_1 = "#aa3731"
vim.g.terminal_color_2 = "#448c27"
vim.g.terminal_color_3 = "#cb9000"
vim.g.terminal_color_4 = "#325cc0"
vim.g.terminal_color_5 = "#7a3e9d"
vim.g.terminal_color_6 = "#0083b2"
vim.g.terminal_color_7 = "#f7f7f7"
vim.g.terminal_color_8 = "#777777"
vim.g.terminal_color_9 = "#f05050"
vim.g.terminal_color_10 = "#60cb00"
vim.g.terminal_color_11 = "#ffbc5d"
vim.g.terminal_color_12 = "#007acc"
vim.g.terminal_color_13 = "#e64ce6"
vim.g.terminal_color_14 = "#00aacb"
vim.g.terminal_color_15 = "#f7f7f7"

-- colors
local bg = "#f7f7f7"
local fg = "#000000"
local punct_fg = "#777777"
local def_fg = "#325cc0"
local const_fg = "#7a3e9d"
local active = "#ffbc5d"
local active_blue = "#007acc"
local string_fg = "#448c27"
local darker_fg = "#7d7d7d"
local diffadd = "#284918"
local diffdelete = "#B40600"
local diffchange = "#ec8013"
local statusline = "#c9c9c9"
local comment = "#aa3731"
local dim_comment = "#696969"
local mistake = {
    fg = "#c33c33",
    bg = "#f8b28f",
}
local ansi = {
    black = "#000000",
    blue = "#325cc0",
    brightyellow = "#ffbc5d",
    cyan = "#0083b2",
    green = "#448c27",
    magenta = "#7a3e9d",
    red = "#aa3731",
    white = "#bbbbbb",
    yellow = "#cb9000",
}
local error = "#d13e23"
local warn = "#BC7500"
local hint = ansi.blue
local info = "#278C00"
local comment_fg = vim.g.alabaster_dim_comments and dim_comment or comment
local pmenu_bg = "#e7e7e7"
local float_bg = vim.g.alabaster_floatborder and bg or pmenu_bg
local floatborder = vim.g.alabaster_floatborder and { bg = bg, fg = "#999999" }
    or {
        bg = float_bg,
        fg = float_bg,
    }

theme = {
    Comment = { fg = comment_fg },
    ColorColumn = { bg = "#E2EEEE" },
    Conceal = { fg = "#b0b0b0" },
    Cursor = { bg = "#007acc", fg = "#bfdbfe" },
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see "guicursor")
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = "#E2EEEE" },
    CursorLine = { bg = "#E2EEEE" },
    Directory = { fg = ansi.blue },
    DiffAdd = { bg = "#ADFFB7", fg = "#0A7816" },
    DiffDelete = { bg = "#F8B28F", fg = "#872C28" },
    DiffText = { fg = "#fff987", bg = "#876004" },
    DiffChange = { bg = "#fff987", fg = "#341a00" },
    EndOfBuffer = { fg = "#b6b6b6" },
    -- TermCursor   { }, -- cursor in a focused terminal
    TermCursorNC = { fg = bg, bg = fg },
    ErrorMsg = { fg = error, bg = mistake.bg },
    VertSplit = { fg = "#abbdc0" },
    Folded = { bg = "#dddddd", fg = "#7d7d7d" },
    FoldColumn = { bg = bg, fg = "#4d4d4d" },
    SignColumn = {},
    IncSearch = { bg = active, fg = fg },
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    LineNr = { fg = "#7d7c7c" },
    CursorLineNr = { fg = ansi.blue, bold = 1 },
    MatchParen = { underline = 1, sp = active },
    -- ModeMsg      { }, -- "showmode" message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of "display"
    MoreMsg = { fg = ansi.green, bold = 1 },
    NonText = { fg = "#696969" },
    Normal = { bg = bg, fg = fg },
    NormalFloat = { bg = float_bg },
    -- NormalNC     { }, -- normal text in non-current windows
    FloatBorder = floatborder,
    Pmenu = { bg = pmenu_bg },
    PmenuSel = { bg = "#c7c7c7" },
    PmenuSbar = { bg = "#777777" },
    PmenuThumb = { bg = "#333333" },
    Question = { fg = ansi.green },
    QuickFixLine = { bg = "#E2EEEE" },
    Search = { bg = "#fae9b7", fg = fg },
    SpecialKey = { fg = ansi.cyan },
    SpellBad = { undercurl = 1, sp = ansi.red },
    SpellCap = { undercurl = 1, sp = ansi.blue },
    SpellLocal = { undercurl = 1, sp = ansi.cyan },
    SpellRare = { undercurl = 1, sp = ansi.magenta },
    StatusLine = { bg = statusline, fg = fg },
    StatusLineNC = { bg = statusline, fg = "#9f9f9f" },
    TabLine = { bg = statusline, fg = "#7d7d7d" },
    TabLineFill = { bg = statusline },
    TabLineSel = { bg = statusline, fg = ansi.blue },
    Title = { fg = const_fg },
    Visual = { bg = "#bfdbfe" },
    VisualNOS = { bg = "#bfdbfe" },
    WarningMsg = { fg = "#e1ad4c" },
    WildMenu = { bg = "#999999" },
    WinBar = { bg = bg, fg = ansi.black, bold = true },
    WinBarNC = { bg = bg, fg = "#7d7d7d" },

    --- SYNTAX I: TS groups link to these
    Constant = { fg = const_fg },
    String = { fg = string_fg },
    Character = { fg = const_fg },
    Number = { fg = const_fg },
    Boolean = { fg = const_fg },
    Float = { fg = const_fg },
    Operator = { fg = punct_fg },

    --- SYNTAX II: TS groups have their own definition, the below are defined to have somewhat working hl w/o treesitter
    Identifier = { fg = ansi.black },
    Function = { fg = def_fg },
    Statement = { fg = ansi.black },
    Conditional = { fg = ansi.black },
    Repeat = { fg = ansi.black },
    Label = { fg = def_fg },
    Keyword = { fg = ansi.black },
    Exception = { fg = ansi.black },
    PreProc = { fg = ansi.black },
    Include = { fg = ansi.black },
    Define = { fg = ansi.black },
    Macro = { fg = ansi.black },
    PreCondit = { fg = ansi.black },
    Type = { fg = ansi.black },
    StorageClass = { fg = ansi.black },
    Structure = { fg = def_fg },
    Typedef = { fg = def_fg },

    Special = { fg = ansi.yellow },
    -- TODO better color than diffchange, try reddish
    -- SpecialChar = { fg = diffchange }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { },
    SpecialComment = { bg = "#FFDEAA", fg = ansi.blue },
    debugPc = { bg = "#C7C7EE" },
    debugBreakpoint = { bg = "#F8B28F" },
    helpHyperTextJump = { fg = ansi.magenta },
    helpSectionDelim = { fg = ansi.magenta },
    helpExample = { fg = ansi.cyan },
    helpCommand = { fg = ansi.cyan },
    helpHeadline = { fg = ansi.blue },
    helpHeader = { fg = ansi.magenta },

    Underlined = { underline = 1 }, -- (preferred) text that stands out, HTML links
    Italic = { italic = 1 },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { bg = mistake.bg, fg = mistake.fg },

    Todo = { bg = "#FFDEAA", fg = ansi.blue },

    --- Diagnostic
    LspReferenceText = { bg = "#dadada" },
    LspReferenceRdad = { bg = "#dadada" },
    LspReferenceWrite = { bg = "#dadada", underline = 1, sp = active_blue },
    LspCodeLens = { fg = "#999999" },
    LspCodeLensSeparator = { fg = "#999999" },

    --- Diagnostic
    DiagnosticError = { fg = error },
    DiagnosticWarn = { fg = warn },
    DiagnosticHint = { fg = hint },
    DiagnosticInfo = { fg = info },
    DiagnosticVirtualTextError = { bg = "#F8B28F", fg = "#411414" },
    DiagnosticVirtualTextWarn = { bg = "#fff987", fg = fg },
    DiagnosticVirtualTextHint = { fg = "#0F171D", bg = "#C3D0DA" },
    DiagnosticVirtualTextInfo = { bg = "#ADFFB7", fg = "#042F09" },

    --- Treesitter
    TSAttribute = {},
    TSConstructor = { fg = ansi.black },
    TSConditional = { fg = ansi.black },
    TSConstBuiltin = { fg = const_fg },
    TSConstMacro = { fg = ansi.black },
    TSError = { bg = mistake.bg, fg = mistake.fg },
    TSException = { fg = ansi.black },
    TSField = { fg = ansi.black },
    TSFunction = { fg = ansi.black },
    TSFuncBuiltin = { fg = ansi.black },
    TSFuncMacro = { fg = ansi.black },
    TSKeyword = { fg = ansi.black },
    TSKeywordFunction = { fg = ansi.black },
    TSLabel = { fg = ansi.black },
    TSMethod = { fg = ansi.black },
    TSNamespace = { fg = ansi.black },
    TSNone = { fg = const_fg },
    TSParameter = { fg = ansi.black },
    TSParameterReference = { fg = ansi.black },
    TSProperty = { fg = ansi.black },
    TSPunctDelimiter = { fg = punct_fg },
    TSPunctBracket = { fg = punct_fg },
    TSPunctSpecial = { fg = punct_fg },
    TSRepeat = { fg = ansi.black },
    TSString = { fg = string_fg },
    TSStringRegex = { bg = bg, fg = "#777777" },
    TSStringEscape = { bg = bg, fg = "#777777" },
    TSSymbol = {},
    TSType = { fg = ansi.black },
    TSTypeBuiltin = { fg = ansi.black },
    TSVariable = { fg = ansi.black },
    TSVariableBuiltin = { fg = ansi.black },
    TSTag = { fg = ansi.black },
    TSTagDelimiter = { fg = punct_fg },
    TSText = { fg = ansi.black },

    ["@attribute"] = {},
    ["@constructor"] = { fg = ansi.black },
    ["@conditional"] = { fg = ansi.black },
    ["@constant.builtin"] = { fg = const_fg },
    ["@constant.macro"] = { fg = ansi.black },
    ["@error"] = { bg = mistake.bg, fg = mistake.fg },
    ["@exception"] = { fg = ansi.black },
    ["@field"] = { fg = ansi.black },
    ["@function"] = { fg = ansi.black },
    ["@function.builtin"] = { fg = ansi.black },
    ["@function.macro"] = { fg = ansi.black },
    ["@keyword"] = { fg = ansi.black },
    ["@keyword.function"] = { fg = ansi.black },
    ["@label"] = { fg = ansi.black },
    ["@method"] = { fg = ansi.black },
    ["@module"] = { fg = ansi.black },
    ["@namespace"] = { fg = ansi.black },
    ["@none"] = { fg = const_fg },
    ["@parameter"] = { fg = ansi.black },
    ["@parameter.reference"] = { fg = ansi.black },
    ["@property"] = { fg = ansi.black },
    ["@punctuation.delimiter"] = { fg = punct_fg },
    ["@punctuation.bracket"] = { fg = punct_fg },
    ["@punctuation.special"] = { fg = punct_fg },
    ["@repeat"] = { fg = ansi.black },
    ["@string"] = { fg = string_fg },
    ["@string.regex"] = { bg = bg, fg = "#777777" },
    ["@string.escape"] = { bg = bg, fg = "#777777" },
    ["@symbol"] = {},
    ["@type"] = { fg = ansi.black },
    ["@type.builtin"] = { fg = ansi.black },
    ["@variable"] = { fg = ansi.black },
    ["@variable.builtin"] = { fg = ansi.black },
    ["@tag"] = { fg = ansi.black },
    ["@tag.delimiter"] = { fg = punct_fg },
    ["@text"] = { fg = ansi.black },
    ["@text.note"] = { bg = "#dddddd", fg = ansi.blue },
    ["@text.warning"] = { bg = "#ffdeaa", fg = ansi.blue },

    --- Theme specific
    ["@AlabasterConstant"] = { fg = const_fg },
    ["@AlabasterDefinition"] = { fg = def_fg },
    ["@AlabasterPunct"] = { fg = punct_fg },
    ["@AlabasterString"] = { fg = string_fg },
    ["@AlabasterHashbang"] = { fg = dim_comment },
    --- Statusline
    StatuslineAdd = { fg = diffadd, bg = statusline },
    StatuslineErr = { fg = "#8E1410", bg = statusline },
    StatuslineHint = { fg = hint, bg = statusline },
    StatuslineInfo = { fg = info, bg = statusline },
    StatuslineWarn = { fg = warn, bg = statusline },
    StatuslineBlue = { fg = ansi.blue, bg = statusline },
    StatuslineRed = { fg = ansi.red, bg = statusline },
    StatuslineGreen = { fg = ansi.green, bg = statusline },
    StatuslineCyan = { fg = ansi.cyan, bg = statusline },
    StatuslineMagenta = { fg = ansi.magenta, bg = statusline },
    --- For `highlight link`
    AlabasterBlack = { fg = ansi.black },
    AlabasterBlue = { fg = ansi.blue },
    AlabasterBrightYellow = { fg = ansi.brightyellow },
    AlabasterCyan = { fg = ansi.cyan },
    AlabasterGreen = { fg = ansi.green },
    AlabasterBrightGreen = { fg = "#60cb00" },
    AlabasterMagenta = { fg = ansi.magenta },
    AlabasterRed = { fg = ansi.red },
    AlabasterWhite = { fg = ansi.black },
    AlabasterYellow = { fg = ansi.yellow },
    --- checkhealth
    healthSuccess = { fg = ansi.green, bg = bg },
    -- Languages
    --- asm
    asmDirective = { fg = dim_comment },
    nasmLabel = { link = "@AlabasterDefinition" },
}

for group, hl in pairs(theme) do
    vim.api.nvim_set_hl(0, group, hl)
end

-- vi:nowrap
