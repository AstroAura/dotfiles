-- ~/.config/nvim/lua/themes/custom_gruvbox.lua
local M = {}

M.base_30 = {
  white = "#c3bbb2",          -- color7/color15
  darker_black = "#090807",   -- color0
  black = "#090807",          -- main background
  black2 = "#545047",         -- color1
  one_bg = "#695748",         -- color2
  one_bg2 = "#756554",        -- color3
  one_bg3 = "#707067",        -- color4
  grey = "#87725F",           -- color5
  grey_fg = "#7D8077",        -- color6
  grey_fg2 = "#88827c",       -- color8
  light_grey = "#c3bbb2",     -- color7/color15
  red = "#545047",            -- color1/color9
  baby_pink = "#87725F",      -- color5/color13
  pink = "#87725F",           -- color5/color13
  line = "#695748",           -- color2
  green = "#695748",          -- color2/color10
  vibrant_green = "#756554",  -- color3/color11
  blue = "#707067",           -- color4/color12
  nord_blue = "#707067",      -- color4/color12
  yellow = "#756554",         -- color3/color11
  sun = "#756554",            -- color3/color11
  purple = "#87725F",         -- color5/color13
  dark_purple = "#87725F",    -- color5/color13
  teal = "#7D8077",           -- color6/color14
  orange = "#756554",         -- color3/color11
  cyan = "#7D8077",           -- color6/color14
  statusline_bg = "#090807",  -- black
  lightbg = "#695748",        -- color2
  pmenu_bg = "#87725F",       -- color5
  folder_bg = "#87725F",      -- color5
}

M.base_16 = {
  base00 = "#090807",  -- black
  base01 = "#545047",
  base02 = "#695748",
  base03 = "#756554",
  base04 = "#707067",
  base05 = "#c3bbb2",  -- white
  base06 = "#c3bbb2",
  base07 = "#c3bbb2",
  base08 = "#545047",  -- red
  base09 = "#756554",  -- orange/yellow
  base0A = "#756554",  -- yellow
  base0B = "#695748",  -- green
  base0C = "#7D8077",  -- cyan
  base0D = "#707067",  -- blue
  base0E = "#87725F",  -- purple
  base0F = "#695748",  -- brown/orange
}

M.type = "dark"

M.polish_hl = {
  Comment = { fg = "#88827c", italic = true },
  Keyword = { fg = "#87725F" },
  Function = { fg = "#87725F" },
  String = { fg = "#695748" },
  Number = { fg = "#756554" },
  Constant = { fg = "#707067" },
  CursorLine = { bg = "#695748" },
  Visual = { bg = "#c3bbb2" },
  Error = { fg = "#545047" },
  Warning = { fg = "#756554" },
  Info = { fg = "#707067" },
  Hint = { fg = "#7D8077" },
}

return M
