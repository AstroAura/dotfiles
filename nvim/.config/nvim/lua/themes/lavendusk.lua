-- ~/.config/nvim/lua/themes/lavendusk.lua
local M = {}

M.base_30 = {
  white = "#DCD7E3",
  darker_black = "#18151F",
  black = "#1E1B26", -- main background
  black2 = "#262231",
  one_bg = "#2E2939",
  one_bg2 = "#383347",
  one_bg3 = "#423B55",
  grey = "#6E657A",
  grey_fg = "#807896",
  grey_fg2 = "#938BAA",
  light_grey = "#A59FBA",
  red = "#E67E94",
  baby_pink = "#E6B0C2",
  pink = "#D8B8E8",
  line = "#2E2939", -- for lines like vertsplit
  green = "#C3D3A5",
  vibrant_green = "#D3E3B5",
  blue = "#B0C2E6",
  nord_blue = "#A0BCE6",
  yellow = "#E6C98B",
  sun = "#EBD59B",
  purple = "#C4AFCB", -- your main color 💜
  dark_purple = "#A98BBF",
  teal = "#A3C6B8",
  orange = "#E6A88B",
  cyan = "#A0D7D6",
  statusline_bg = "#262231",
  lightbg = "#2E2939",
  pmenu_bg = "#C4AFCB",
  folder_bg = "#A98BBF",
}

M.base_16 = {
  base00 = "#1E1B26",
  base01 = "#262231",
  base02 = "#2E2939",
  base03 = "#6E657A",
  base04 = "#807896",
  base05 = "#DCD7E3",
  base06 = "#E6E2EE",
  base07 = "#F2EEF9",
  base08 = "#E67E94",
  base09 = "#E6A88B",
  base0A = "#E6C98B",
  base0B = "#C3D3A5",
  base0C = "#A0D7D6",
  base0D = "#B0C2E6",
  base0E = "#C4AFCB",
  base0F = "#E6B0C2",
}

M.type = "dark"

M.polish_hl = {
  Comment = { fg = "#6E657A", italic = true },
  Keyword = { fg = "#C4AFCB" },
  Function = { fg = "#D8B8E8" },
  String = { fg = "#C3D3A5" },
  Number = { fg = "#E6B0C2" },
  Constant = { fg = "#B0C2E6" },
  CursorLine = { bg = "#2E2939" },
  Visual = { bg = "#3B3349" },
  Error = { fg = "#E67E94" },
  Warning = { fg = "#E6C98B" },
  Info = { fg = "#A0BCE6" },
  Hint = { fg = "#C4AFCB" },
}

return M

