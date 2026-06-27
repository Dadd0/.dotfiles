# Dotfiles

My configuration files for various tools, organized with one folder per tool. Each directory maps to `~/.config/<tool>`.

## Contents

| Tool | Description |
|------|-------------|
| [helix](helix/) | Editor config |
| [ghostty](ghostty/) | Terminal |
| [tmux](tmux/) | Multiplexer |
| [starship](starship/) | Shell prompt |
| [zed](zed/) | Editor config with Catppuccin Blur theme (git submodule) |
| [wofi](wofi/) | App launcher |

## Install

Symlink all tool folders into `~/.config` from the repo root:

```bash
for dir in */; do
    ln -sfn "$PWD/$dir" ~/.config/"$(basename "$dir")"
done
```

Or for a single tool:

```bash
ln -sfn ~/dev/dotfiles/<tool> ~/.config/<tool>
```

After cloning, run `git submodule update --init` to fetch the Zed theme.
