return{
-- Disable heading highlights
vim.api.nvim_set_hl(0, "MarkviewHeading", {});
vim.api.nvim_set_hl(0, "MarkviewHeading1", {});
vim.api.nvim_set_hl(0, "MarkviewHeading2", {});
vim.api.nvim_set_hl(0, "MarkviewHeading3", {});
vim.api.nvim_set_hl(0, "MarkviewHeading4", {});
vim.api.nvim_set_hl(0, "MarkviewHeading5", {});
vim.api.nvim_set_hl(0, "MarkviewHeading6", {});

-- Disable indent‑block line highlights
vim.api.nvim_set_hl(0, "MarkviewIndentBlock", {}),
vim.api.nvim_set_hl(0,"CursorLine",{
  bg = "NONE"
});

vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", {
  fg = "#756554",
  bg = "NONE",
  bold = true,
});

vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", {
  fg = "#695748",
  bg = "NONE",
  bold = false,
});
vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", {
  fg = "#545047",
  bg = "NONE",
  bold = false,
});
vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", {
  fg = "#545047",
  bg = "NONE",
  bold = false,
});
}
