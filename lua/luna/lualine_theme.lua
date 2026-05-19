-- luna/lualine_theme.lua
-- Lualine colour theme for Luna. Requires lualine.nvim.
-- Usage:
--   require('lualine').setup { options = { theme = 'luna' } }

local palette = require("luna.palette")
local config  = require("luna.config")
local c = palette.get(config.variant)

local luna_lualine = {}

local mode_bg  = c.green_func
local insert_bg= c.blue_type
local visual_bg= c.pink
local replace_bg= c.red_key_w
local cmd_bg   = c.orange_warn

luna_lualine.normal = {
  a = { fg = c.bg_dark, bg = mode_bg,  gui = "bold" },
  b = { fg = c.fg,      bg = c.black1 },
  c = { fg = c.comment, bg = c.bg_dark },
}

luna_lualine.insert = {
  a = { fg = c.bg_dark, bg = insert_bg, gui = "bold" },
  b = { fg = c.fg,      bg = c.black1 },
  c = { fg = c.comment, bg = c.bg_dark },
}

luna_lualine.visual = {
  a = { fg = c.bg_dark, bg = visual_bg, gui = "bold" },
  b = { fg = c.fg,      bg = c.black1 },
  c = { fg = c.comment, bg = c.bg_dark },
}

luna_lualine.replace = {
  a = { fg = c.bg_dark, bg = replace_bg, gui = "bold" },
  b = { fg = c.fg,      bg = c.black1 },
  c = { fg = c.comment, bg = c.bg_dark },
}

luna_lualine.command = {
  a = { fg = c.bg_dark, bg = cmd_bg, gui = "bold" },
  b = { fg = c.fg,      bg = c.black1 },
  c = { fg = c.comment, bg = c.bg_dark },
}

luna_lualine.inactive = {
  a = { fg = c.comment, bg = c.bg_dark, gui = "bold" },
  b = { fg = c.comment, bg = c.bg_dark },
  c = { fg = c.comment, bg = c.bg_dark },
}

return luna_lualine
