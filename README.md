# Personal Dotfiles Using `stow` 

GNU Stow is a symlink farm manager that creates symbolic links from a source directory to a target directory.

# Stow Required Filestructure 
```
.dotfiles/
├── ghostty/
│   └── .config/
│       └── ghostty/
│           └── config
├── helix/
│   └── .config/
│       └── helix/
│           ├── config.toml
│           └── languages.toml
└── starship/
    └── .config/
        └── starship.toml
```

## Creating Symlinks
Run `stow ghostty helix starship <...>`

## Removing Symlinks
To uninstall the symlinks:

```bash
cd ~/.dotfiles
stow -D ghostty helix starship
```
