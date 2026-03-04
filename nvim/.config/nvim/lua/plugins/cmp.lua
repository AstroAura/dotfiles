return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    -- Highlight first item
    opts.preselect = cmp.PreselectMode.Item

    -- Show menu, but don't insert automatically
    opts.completion = {
      completeopt = "menu,menuone,noinsert",
    }

    return opts
  end,
}
