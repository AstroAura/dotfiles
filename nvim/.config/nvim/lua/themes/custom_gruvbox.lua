-- ~/.config/nvim/lua/themes/custom_gruvbox.lua
local M = {}

M.base_30 = {
  white = "#c3bbb2",
  darker_black = "NONE",     -- transparency friendly
  black = "NONE",            -- allow foot transparency
  black2 = "#545047",

  one_bg = "#695748",
  one_bg2 = "#756554",
  one_bg3 = "#707067",

  grey = "#87725F",
  grey_fg = "#7D8077",
  grey_fg2 = "#88827c",
  light_grey = "#c3bbb2",

  red = "#545047",
  baby_pink = "#87725F",
  pink = "#87725F",

  line = "#695748",
  green = "#695748",
  vibrant_green = "#756554",
  blue = "#707067",
  nord_blue = "#707067",
  yellow = "#756554",
  sun = "#756554",
  purple = "#87725F",
  dark_purple = "#87725F",
  teal = "#7D8077",
  orange = "#756554",
  cyan = "#7D8077",

  statusline_bg = "NONE",     -- transparent statusline
  lightbg = "#695748",
  pmenu_bg = "#87725F",
  folder_bg = "#87725F",
}

M.base_16 = {
  base00 = "NONE",   -- main background transparent
  base01 = "#545047",
  base02 = "#695748",
  base03 = "#756554",
  base04 = "#707067",
  base05 = "#c3bbb2",
  base06 = "#c3bbb2",
  base07 = "#c3bbb2",

  base08 = "#545047",
  base09 = "#756554",
  base0A = "#756554",
  base0B = "#695748",
  base0C = "#7D8077",
  base0D = "#707067",
  base0E = "#87725F",
  base0F = "#695748",
}

M.type = "dark"

M.polish_hl = {
  Comment = { fg = "#88827c", italic = true },
  Keyword = { fg = "#87725F" },
  Function = { fg = "#87725F" },
  String = { fg = "#695748" },
  Number = { fg = "#756554" },
  Constant = { fg = "#707067" },

  -- transparency safe
  CursorLine = { bg = "NONE" },
  Visual = { bg = "NONE" },
  SignColumn = { bg = "NONE" },

  NormalFloat = { bg = "NONE" },
  FloatBorder = { bg = "NONE" },

  Error = { fg = "#545047" },
  Warning = { fg = "#756554" },
  Info = { fg = "#707067" },
  Hint = { fg = "#7D8077" },
}

return M
