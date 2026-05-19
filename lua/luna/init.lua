-- luna/init.lua
-- Entry point for the Luna Neovim colorscheme.
--
-- Usage (minimal):
--   vim.cmd.colorscheme("luna")          -- default variant (soft-red accent)
--
-- Usage (with options):
--   require("luna").setup({
--     variant                = "sol",    -- "default" | "sol"
--     transparent_background = false,
--     italic_comments        = true,
--     italic_keywords        = false,
--     italic_booleans        = false,
--     italic_functions       = false,
--     italic_variables       = false,
--   })
--   vim.cmd.colorscheme("luna")
--
-- Variant "default"  →  soft dusty-red accent
-- Variant "sol"      →  warm golden-yellow accent

local M = {}

function M.setup(opts)
  local config = require("luna.config")
  config.setup(opts or {})
end

function M.load(variant_override)
  local config  = require("luna.config")
  local palette = require("luna.palette")
  local theme   = require("luna.theme")

  -- Allow callers to force a variant without a full setup() call
  if variant_override then
    config.options.variant = variant_override
  end

  local variant = config.variant or "default"
  local colors  = palette.get(variant)
  local groups  = theme.setup(colors)

  -- Reset
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.background    = "dark"
  vim.g.colors_name   = colors.variant_name or "luna"
  vim.o.termguicolors = true

  -- Apply highlights
  for group, opts in pairs(groups) do
    -- Normalise: convert style string → boolean fields for nvim_set_hl
    local hl = {}
    if opts.fg    then hl.fg        = opts.fg    end
    if opts.bg    then hl.bg        = opts.bg    end
    if opts.sp    then hl.sp        = opts.sp    end
    if opts.bold  then hl.bold      = opts.bold  end
    if opts.italic then hl.italic   = opts.italic end
    if opts.underline then hl.underline = opts.underline end
    if opts.undercurl then hl.undercurl = opts.undercurl end
    if opts.strikethrough then hl.strikethrough = opts.strikethrough end
    if opts.reverse   then hl.reverse   = opts.reverse   end
    if opts.nocombine then hl.nocombine = opts.nocombine end
    if opts.link      then hl.link      = opts.link      end

    -- Legacy `style` string support (from oh-lucy compat)
    if opts.style then
      for _, s in ipairs(vim.split(opts.style, ",")) do
        s = vim.trim(s)
        if s == "bold"          then hl.bold          = true end
        if s == "italic"        then hl.italic        = true end
        if s == "underline"     then hl.underline     = true end
        if s == "undercurl"     then hl.undercurl     = true end
        if s == "strikethrough" then hl.strikethrough = true end
        if s == "reverse"       then hl.reverse       = true end
        if s == "nocombine"     then hl.nocombine     = true end
      end
    end

    -- Remove NONE placeholders so nvim_set_hl doesn't error
    if hl.fg == "NONE" then hl.fg = nil end
    if hl.bg == "NONE" then hl.bg = nil end

    local ok, err = pcall(vim.api.nvim_set_hl, 0, group, hl)
    if not ok then
      vim.notify("[luna] highlight error for " .. group .. ": " .. tostring(err), vim.log.levels.WARN)
    end
  end

  -- Register lualine theme so `theme = 'luna'` works automatically
  local ok_ll = pcall(function()
    require("lualine.themes.luna")  -- no-op if already cached
  end)
  if not ok_ll then
    -- lualine not installed – fine, skip
  end
end

-- Auto-load when used as a colorscheme file (colors/luna.lua calls this)
function M.colorscheme()
  M.load()
end

return M
