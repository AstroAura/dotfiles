-- ~/.config/nvim/lua/themes/soft_gruvbox.lua
local M = {}

M.base_30 = {
  white = "#EBDBB2",
  darker_black = "#1C1B19",
  black = "#1C1B19",        -- main background
  black2 = "#272422",
  one_bg = "#282828",
  one_bg2 = "#32302F",
  one_bg3 = "#3C3836",
  grey = "#7C6F64",
  grey_fg = "#928374",
  grey_fg2 = "#A89984",
  light_grey = "#BDAE93",
  red = "#CC241D",
  baby_pink = "#FB4934",
  pink = "#D3869B",
  line = "#3C3836",         -- vertsplit / lines
  green = "#98971A",
  vibrant_green = "#B8BB26",
  blue = "#458588",
  nord_blue = "#83A598",
  yellow = "#D79921",
  sun = "#FABD2F",
  purple = "#B16286",
  dark_purple = "#8F3F71",
  teal = "#689D6A",
  orange = "#D65D0E",
  cyan = "#8EC07C",
  statusline_bg = "#282828",
  lightbg = "#32302F",
  pmenu_bg = "#504945",
  folder_bg = "#B16286",
}

M.base_16 = {
  base00 = "#1C1B19",
  base01 = "#282828",
  base02 = "#32302F",
  base03 = "#7C6F64",
  base04 = "#928374",
  base05 = "#EBDBB2",
  base06 = "#D5C4A1",
  base07 = "#F2E5BC",
  base08 = "#FB4934",
  base09 = "#FE8019",
  base0A = "#FABD2F",
  base0B = "#B8BB26",
  base0C = "#8EC07C",
  base0D = "#83A598",
  base0E = "#B16286",
  base0F = "#D65D0E",
}

M.type = "dark"

M.polish_hl = {
  Comment = { fg = "#928374", italic = true },
  Keyword = { fg = "#B16286" },
  Function = { fg = "#D3869B" },
  String = { fg = "#B8BB26" },
  Number = { fg = "#FE8019" },
  Constant = { fg = "#83A598" },
  CursorLine = { bg = "#282828" },
  Visual = { bg = "#504945" },
  Error = { fg = "#FB4934" },
  Warning = { fg = "#FABD2F" },
  Info = { fg = "#83A598" },
  Hint = { fg = "#8EC07C" },
}

return M
