# midnight-crystal

a dark neovim colorscheme

![palette](palette.png)

## installation

### lazy.nvim

```lua
{
  'lairizzle/midnight-crystal',
  lazy = false,
  priority = 1000,
  config = function()
    require('midnight-crystal').setup()
  end,
}
```

### packer.nvim

```lua
use {
  'lairizzle/midnight-crystal',
  config = function()
    require('midnight-crystal').setup()
  end
}
```

## requirements

- neovim >= 0.8.0
- `termguicolors` enabled

```lua
vim.opt.termguicolors = true
```

## features

- tree-sitter support
- lsp semantic highlighting
- plugin integrations (telescope, lualine, nvim-tree, gitsigns, nvim-cmp)
- carefully balanced color palette

## configuration

```lua
require('midnight-crystal').setup({
  -- your config here
})
```

## license

MIT
