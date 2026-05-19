-- luna/palette.lua
-- Palette variants for the Luna colorscheme.

local M = {}

-- ─────────────────────────────────────────────────────────────
--  Shared base (same across all variants)
-- ─────────────────────────────────────────────────────────────
local base = {
  -- Backgrounds
  bg           = "#1B1D26",
  bg_dark      = "#14161D",
  bg_popup     = "#14161D",
  bg_float     = "#14161D",
  bg_sidebar   = "#14161D",
  bg_statusline= "#21252D",
  bg_cursorline= "#1F212B",
  bg_visual    = "#272932",

  -- Foregrounds / grays
  fg           = "#D7D7D7",
  fg_dim       = "#AEAFAD",
  fg_bright    = "#E9E9E9",

  comment      = "#5E6173",
  non_text     = "#606978",
  line_nr      = "#555B6C",
  gray_punc    = "#7C7E8C",
  gray2        = "#6E7380",
  gray1        = "#343842",
  gray0        = "#21252D",
  black1       = "#272932",
  black        = "#14161D",

  selection_bg = "#5E697E",
  selection_fg = "#495163",
  vsplit       = "#21252D",

  -- Semantic colours (shared)
  red_err      = "#E05555",
  keyword      = "#E8756B",
  green_func   = "#6DCFA8",
  green        = "#6ECFA8",
  blue_type    = "#7EC4DE",
  orange       = "#E8717E",
  orange_warn  = "#E8A05A",
  boolean      = "#B8A0EE",
  yellow       = "#C8B55E",

  -- Git / diff
  diff_add     = "#8CD881",
  diff_change  = "#6CAEC0",
  diff_text    = "#568BB4",

  -- Cursor
  cursor_fg    = "#D7D7D7",
  cursor_bg    = "#AEAFAD",

  -- Misc
  accent       = "#BBBBBB",
  none         = "NONE",
}

-- ─────────────────────────────────────────────────────────────
--  Variant accent colours
-- ─────────────────────────────────────────────────────────────
local variants = {
  default = {
    accent1      = "#BDA9D4",
    keyword      = "#E8756B",
    variant_name = "luna",
  },
  sol = {
    accent1      = "#D4B96A",
    keyword      = "#D4956A",
    variant_name = "luna-sol",
  },
}

-- ─────────────────────────────────────────────────────────────
--  Public API: M.get(variant_name)  →  merged colour table
-- ─────────────────────────────────────────────────────────────
function M.get(variant)
  variant = variant or "default"
  local v = variants[variant] or variants["default"]
  local colors = vim.tbl_extend("force", base, v)

  colors.pink      = colors.accent1
  colors.red_key_w = colors.keyword
  colors.white     = colors.fg_bright
  colors.white1    = colors.fg
  colors.dark      = colors.bg_dark
  colors.line_bg   = colors.bg
  colors.gutter_bg = colors.bg

  return colors
end

M.variants = variants
M.base     = base

return M
