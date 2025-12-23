# Personal Dotfiles

Simple tree structure with a folder per tool:

```
.dotfiles/
├── ghostty/
│   └── config
├── helix/
│   ├── config.toml
│   └── languages.toml
├── starship/
│   └── starship.toml
└── wofi/
    ├── config
    ├── mocha.css
    ├── README.md
    └── start_wofi.sh
```

## Installing (manual symlinks)

```bash
ln -s ~/.dotfiles/ghostty ~/.config/ghostty
ln -s ~/.dotfiles/helix ~/.config/helix
ln -s ~/.dotfiles/wofi ~/.config/wofi
ln -s ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
```
