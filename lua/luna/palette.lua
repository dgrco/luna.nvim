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
  red_err      = "#D95555",
  keyword      = "#E07070",   -- soft red for keywords/conditionals
  green_func   = "#74C7A4",
  green        = "#76C5A4",
  blue_type    = "#8DBBD3",
  orange       = "#E0828D",
  orange_warn  = "#E39A65",
  boolean      = "#AF98E6",
  yellow       = "#E3CF65",

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
  -- Default: soft dusty-red accent (replaces oh-lucy's bright pink)
  default = {
    accent1         = "#C97070",   -- soft red  (was "#BDA9D4" pink)
    keyword         = "#E07070",   -- keyword / conditional (keeps existing)
    variant_name    = "luna",
  },

  -- Sol: warm golden-yellow accent
  sol = {
    accent1         = "#D4B96A",   -- soft yellow (was "#BDA9D4" pink)
    keyword         = "#D4956A",   -- slightly amber-shifted keyword
    variant_name    = "luna-sol",
  },
}

-- ─────────────────────────────────────────────────────────────
--  Public API: M.get(variant_name)  →  merged colour table
-- ─────────────────────────────────────────────────────────────
function M.get(variant)
  variant = variant or "default"
  local v = variants[variant] or variants["default"]
  local colors = vim.tbl_extend("force", base, v)

  -- Convenience aliases so theme.lua can stay readable
  colors.pink      = colors.accent1   -- all `pink` refs in oh-lucy → accent1
  colors.red_key_w = colors.keyword   -- all keyword refs
  colors.white     = colors.fg_bright
  colors.white1    = colors.fg
  colors.dark      = colors.bg_dark
  colors.line_bg   = colors.bg
  colors.gutter_bg = colors.bg

  return colors
end

-- Return both variants for terminal-theme generation scripts
M.variants = variants
M.base     = base

return M
