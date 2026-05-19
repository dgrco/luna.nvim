# Luna

A Neovim colorscheme inspired by **oh-lucy**, sharing its dark navy base and muted-neon syntax palette while adding full plugin coverage and palette variants.

---

## Installation

### lazy.nvim
```lua
{
  "dgrco/luna.nvim",
  priority = 1000,
  config = function()
    require("luna").setup({
      variant                = "default", -- "default" | "sol"
      transparent_background = false,
      italic_comments        = true,
      italic_keywords        = false,
      italic_booleans        = false,
      italic_functions       = false,
      italic_variables       = false,
    })
    vim.cmd.colorscheme("luna")
    -- or: vim.cmd.colorscheme("luna-sol")
  end,
}
```

### packer.nvim
```lua
use {
  "dgrco/luna.nvim",
  config = function()
    require("luna").setup({ variant = "default" })
    vim.cmd("colorscheme luna")
  end,
}
```

### Manual / no plugin manager
Clone into your Neovim runtime path, then:
```lua
vim.cmd.colorscheme("luna")
```

---

## Lualine

```lua
require("lualine").setup({
  options = { theme = "luna" },
})
```

---

## Terminal themes

Pre-built themes for three terminals live in `terminal/`:

### Alacritty (TOML, ≥ 0.12)
```
terminal/alacritty/luna.toml
terminal/alacritty/luna-sol.toml
```
In your `alacritty.toml`:
```toml
[general]
import = ["~/.config/alacritty/themes/luna.toml"]
```

### Kitty
```
terminal/kitty/luna.conf
terminal/kitty/luna-sol.conf
```
In your `kitty.conf`:
```
include ~/.config/kitty/themes/luna.conf
```

### Foot
```
terminal/foot/luna
terminal/foot/luna-sol
```
In your `foot.ini`:
```ini
[colors]
include=~/.config/foot/themes/luna
```

---

## Supported plugins

| Category | Plugins |
|----------|---------|
| **Completion** | nvim-cmp, blink.cmp |
| **Fuzzy finding** | Telescope, fzf-lua |
| **File trees** | nvim-tree, neo-tree, oil.nvim, NERDTree |
| **Git** | Gitsigns, Neogit, Diffview, vim-gitgutter |
| **Diagnostics / LSP** | All DiagnosticXxx groups, LspXxx (legacy), Fidget, Noice, nvim-notify |
| **Debugging** | nvim-dap + dap-ui |
| **Treesitter** | All @-captures (v2 + v3 dot-notation) |
| **UI & motion** | which-key, flash.nvim, leap.nvim, harpoon |
| **Indent** | indent-blankline v2 & v3 (IblXxx), vim-indent-guides |
| **Statusline** | lualine (built-in theme), mini.statusline |
| **Bufferline** | barbar (BufferXxx), bufferline.nvim (BufferLineXxx) |
| **Dashboard** | dashboard-nvim, alpha-nvim, snacks.dashboard |
| **Scrollbar** | nvim-scrollbar |
| **Symbols** | aerial.nvim, symbols-outline |
| **Illuminate** | vim-illuminate |
| **Marks** | marks.nvim |
| **Testing** | neotest |
| **Package managers** | lazy.nvim, mason.nvim |
| **Mini suite** | All mini.nvim modules with highlight groups |
| **Markdown** | render-markdown.nvim, headlines.nvim, standard markdownXxx groups |
| **Misc** | todo-comments, rainbow-delimiters, copilot.vim, treesitter-context, vim-startify, flutter-tools, cmake syntax |
