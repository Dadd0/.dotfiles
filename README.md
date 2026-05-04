# Personal Dotfiles

My configuration files and settings for various tools. 

This repository is organized with a simple structure: **one folder per tool**. Each directory contains the configuration files intended for `~/.config/<tool>`.

## Installation

These configurations can be installed by symlinking the directories to the `~/.config` folder.

### Automated Symlinking (

Run this loop in your terminal from inside the `.dotfiles` directory to automatically symlink all tool folders into `~/.config`:

```bash
cd ~/.dotfiles

# Loop through all directories and create symlinks in ~/.config
for dir in */ ; do
    tool=$(basename "$dir")
    
    # Skip any non-tool directories if needed (e.g., scripts)
    # if [ "$tool" = "scripts" ]; then continue; fi
    
    ln -sfn "$PWD/$tool" ~/.config/"$tool"
    echo "Symlinked $tool -> ~/.config/$tool"
done
```

### Manual Symlinks

For a specific tool:

```bash
ln -s ~/.dotfiles/<tool> ~/.config/<tool>
```
