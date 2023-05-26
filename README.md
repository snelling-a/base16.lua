# base16.nvim

Neovim plugin for building base16 colorschemes with support for Neovim's
builtin LSP and Treesitter.

https://user-images.githubusercontent.com/21000943/199322658-ecbf8113-fa4b-409b-a562-be4a100de844.mov

```lua
-- All builtin colorschemes can be accessed with |:colorscheme|.
vim.cmd.colorscheme('base16-default-dark')

-- Alternatively, you can provide a table specifying your colors to the setup function.
require('base16-colorscheme').setup({
    base00 = '#16161D', base01 = '#2c313c', base02 = '#3e4451', base03 = '#6c7891',
    base04 = '#565c64', base05 = '#abb2bf', base06 = '#9a9bb3', base07 = '#c5c8e6',
    base08 = '#e06c75', base09 = '#d19a66', base0A = '#e5c07b', base0B = '#98c379',
    base0C = '#56b6c2', base0D = '#0184bc', base0E = '#c678dd', base0F = '#a06949',
})
```

## Builtin Colorschemes
see the [list](./colors/README.md)

### credit
[@RRethy](https://github.com/RRethy) for the original highlighting: [RRrethy/nvim-base16](https://github.com/RRethy/nvim-base16)
