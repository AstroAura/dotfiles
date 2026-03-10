-- ~/.config/nvim/lua/themes/coffee.lua
local M = {}

-- Coffee palette, light → dark:
--   #ede0cc  parchment   (brightest highlight)
--   #d8c4a8  cream
--   #c3bbb2  latte       (original white — kept)
--   #b08060  caramel     (new warm mid-accent)
--   #a07858  tan
--   #88827c  warm grey   (original grey_fg2 — kept)
--   #87725F  coffee      (original grey — kept)
--   #756554  dark coffee (original one_bg2 — kept)
--   #695748  espresso    (original one_bg — kept)
--   #545047  dark roast  (original black2 — kept)
--   #3a3025  deep roast  (new, for true darks)

M.base_30 = {
  white         = "#ede0cc",       -- parchment: brighter than original for contrast
  darker_black  = "NONE",
  black         = "NONE",
  black2        = "#3a3025",       -- deep roast

  one_bg        = "#545047",       -- dark roast
  one_bg2       = "#695748",       -- espresso
  one_bg3       = "#756554",       -- dark coffee

  grey          = "#756554",
  grey_fg       = "#88827c",
  grey_fg2      = "#a07858",
  light_grey    = "#c3bbb2",

  -- accents now span the full palette range for distinction
  red           = "#a07858",       -- tan: errors/warnings (warm, stands out)
  baby_pink     = "#c3bbb2",       -- latte
  pink          = "#b08060",       -- caramel

  line          = "#545047",
  green         = "#b08060",       -- caramel: "positive" accent
  vibrant_green = "#d8c4a8",       -- cream: bright positive
  blue          = "#88827c",       -- warm grey
  nord_blue     = "#a07858",       -- tan
  yellow        = "#c3bbb2",       -- latte
  sun           = "#ede0cc",       -- parchment: brightest
  purple        = "#b08060",       -- caramel
  dark_purple   = "#87725F",       -- coffee
  teal          = "#a07858",       -- tan
  orange        = "#b08060",       -- caramel
  cyan          = "#88827c",       -- warm grey

  statusline_bg = "NONE",
  lightbg       = "#545047",
  pmenu_bg      = "#756554",
  folder_bg     = "#b08060",
}

M.base_16 = {
  base00 = "NONE",       -- background transparent
  base01 = "#3a3025",    -- bg highlight (deep roast)
  base02 = "#545047",    -- selection bg (dark roast)
  base03 = "#87725F",    -- comments (coffee — readable, receded)
  base04 = "#a07858",    -- dark fg (tan)
  base05 = "#c3bbb2",    -- default fg (latte)
  base06 = "#d8c4a8",    -- light fg (cream)
  base07 = "#ede0cc",    -- lightest fg (parchment)

  -- semantic slots: now each is a distinct step on the palette
  base08 = "#a07858",    -- tan    — variables / errors
  base09 = "#b08060",    -- caramel — integers / booleans
  base0A = "#c3bbb2",    -- latte  — classes / warnings
  base0B = "#d8c4a8",    -- cream  — strings (bright, easy to spot)
  base0C = "#88827c",    -- warm grey — regex / escape seqs
  base0D = "#87725F",    -- coffee — functions
  base0E = "#756554",    -- dark coffee — keywords
  base0F = "#695748",    -- espresso — deprecated / special
}

M.type = "dark"

M.polish_hl = {
  Comment  = { fg = "#87725F", italic = true },   -- coffee, receded
  Keyword  = { fg = "#c3bbb2" },                  -- latte, prominent
  Function = { fg = "#d8c4a8" },                  -- cream, bright
  String   = { fg = "#b08060" },                  -- caramel, warm accent
  Number   = { fg = "#a07858" },                  -- tan
  Constant = { fg = "#c3bbb2" },                  -- latte

  -- transparency safe
  CursorLine  = { bg = "NONE" },
  Visual      = { bg = "NONE" },
  SignColumn  = { bg = "NONE" },

  NormalFloat = { bg = "NONE" },
  FloatBorder = { bg = "NONE" },

  Error   = { fg = "#a07858" },                   -- tan (warmest non-bg tone)
  Warning = { fg = "#b08060" },                   -- caramel
  Info    = { fg = "#c3bbb2" },                   -- latte
  Hint    = { fg = "#88827c" },                   -- warm grey, subtle
}

return M
