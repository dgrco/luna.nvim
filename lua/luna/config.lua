-- luna/config.lua
local M = {}

M.defaults = {
  variant                = "default",  -- "default" | "sol"
  transparent_background = false,
  italic_comments        = true,
  italic_keywords        = false,
  italic_booleans        = false,
  italic_functions       = false,
  italic_variables       = false,
}

M.options = {}

function M.setup(user_opts)
  M.options = vim.tbl_deep_extend("force", M.defaults, user_opts or {})
end

setmetatable(M, {
  __index = function(_, key)
    if M.options[key] ~= nil then return M.options[key] end
    return M.defaults[key]
  end,
})

return M
