# base16.nvim

Neovim plugin for building base16 colorschemes with support for Neovim's
builtin LSP and Treesitter.

- [vim-illuminate](https://github.com/RRethy/vim-illuminate) like reference highlighting

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
<!--start autogenerated list-->
- 3024
- apathy
- apprentice
- ashes
- atelier-cave-light
- atelier-cave
- atelier-dune-light
- atelier-dune
- atelier-estuary-light
- atelier-estuary
- atelier-forest-light
- atelier-forest
- atelier-heath-light
- atelier-heath
- atelier-lakeside-light
- atelier-lakeside
- atelier-plateau-light
- atelier-plateau
- atelier-savanna-light
- atelier-savanna
- atelier-seaside-light
- atelier-seaside
- atelier-sulphurpool-light
- atelier-sulphurpool
- atlas
- ayu-dark
- ayu-light
- ayu-mirage
- bespin
- black-metal-bathory
- black-metal-burzum
- black-metal-dark-funeral
- black-metal-gorgoroth
- black-metal-immortal
- black-metal-khold
- black-metal-marduk
- black-metal-mayhem
- black-metal-nile
- black-metal-venom
- black-metal
- blueforest
- blueish
- brewer
- bright
- brogrammer
- brushtrees-dark
- brushtrees
- caroline
- catppuccin-frappe
- catppuccin-latte
- catppuccin-macchiato
- catppuccin-mocha
- chalk
- circus
- classic-dark
- classic-light
- codeschool
- colors
- cupcake
- cupertino
- da-one-black
- da-one-gray
- da-one-ocean
- da-one-paper
- da-one-sea
- da-one-white
- danqing-light
- danqing
- darcula
- darkmoss
- darktooth
- darkviolet
- decaf
- default-dark
- default-light
- dirtysea
- dracula
- edge-dark
- edge-light
- eighties
- embers
- emil
- equilibrium-dark
- equilibrium-gray-dark
- equilibrium-gray-light
- equilibrium-light
- eris
- espresso
- eva-dim
- eva
- evenok-dark
- everforest
- flat
- framer
- fruit-soda
- gigavolt
- github
- google-dark
- google-light
- gotham
- grayscale-dark
- grayscale-light
- greenscreen
- gruber
- gruvbox-dark-hard
- gruvbox-dark-medium
- gruvbox-dark-pale
- gruvbox-dark-soft
- gruvbox-light-hard
- gruvbox-light-medium
- gruvbox-light-soft
- gruvbox-material-dark-hard
- gruvbox-material-dark-medium
- gruvbox-material-dark-soft
- gruvbox-material-light-hard
- gruvbox-material-light-medium
- gruvbox-material-light-soft
- hardcore
- harmonic16-dark
- harmonic16-light
- heetch-light
- heetch
- helios
- hopscotch
- horizon-dark
- horizon-light
- horizon-terminal-dark
- horizon-terminal-light
- humanoid-dark
- humanoid-light
- ia-dark
- ia-light
- icy
- irblack
- isotope
- kanagawa
- katy
- kimber
- lime
- macintosh
- marrakesh
- materia
- material-darker
- material-lighter
- material-palenight
- material-vivid
- material
- mellow-purple
- mexico-light
- mocha
- monokai
- mountain
- nebula
- nord
- nova
- ocean
- oceanicnext
- one-light
- onedark
- outrun-dark
- pandora
- papercolor-dark
- papercolor-light
- paraiso
- pasque
- phd
- pico
- pinky
- pop
- porple
- primer-dark-dimmed
- primer-dark
- primer-light
- purpledream
- qualia
- railscasts
- rebecca
- rose-pine-dawn
- rose-pine-moon
- rose-pine
- sagelight
- sakura
- sandcastle
- selenized-black
- selenized-dark
- selenized-light
- selenized-white
- seti
- shades-of-purple
- shadesmear-dark
- shadesmear-light
- shapeshifter
- silk-dark
- silk-light
- snazzy
- solarflare-light
- solarflare
- solarized-dark
- solarized-light
- spaceduck
- spacemacs
- standardized-dark
- standardized-light
- stella
- still-alive
- summercamp
- summerfruit-dark
- summerfruit-light
- synth-midnight-dark
- synth-midnight-light
- tango
- tarot
- tender
- tokyo-city-dark
- tokyo-city-light
- tokyo-city-terminal-dark
- tokyo-city-terminal-light
- tokyo-night-dark
- tokyo-night-light
- tokyo-night-storm
- tokyo-night-terminal-dark
- tokyo-night-terminal-light
- tokyo-night-terminal-storm
- tokyodark-terminal
- tokyodark
- tomorrow-night-eighties
- tomorrow-night
- tomorrow
- tube
- twilight
- unikitty-dark
- unikitty-light
- unikitty-reversible
- uwunicorn
- vice
- vulcan
- windows-10-light
- windows-10
- windows-95-light
- windows-95
- windows-highcontrast-light
- windows-highcontrast
- windows-nt-light
- windows-nt
- woodland
- xcode-dusk
- zenbones
- zenburn
<!--end autogenerated list-->

### credit
[RRethy](https://github.com/RRethy) for the original highlighting: [RRrethy/nvim-base16](https://github.com/RRethy/nvim-base16)
