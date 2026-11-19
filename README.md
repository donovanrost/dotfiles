# dotfiles

Machine setup driven by [`mise bootstrap`](https://mise.jdx.dev/bootstrap.html).

## New machine

```sh
xcode-select --install                       # git + compilers
curl https://mise.run | sh                   # installs ~/.local/bin/mise
git clone https://github.com/donovanrost/dotfiles.git ~/dotfiles
mkdir -p ~/.config && ln -sfn ~/dotfiles/mise ~/.config/mise
~/.local/bin/mise bootstrap --dry-run        # preview
~/.local/bin/mise bootstrap                  # apply, then open a new terminal
```

## Layout

- `mise/config.toml` — packages (Homebrew), dotfiles, login shell, tools
- `zsh/zshrc`, `zsh/zprofile` — symlinked to `~/.zshrc`, `~/.zprofile`
- `starship/starship.toml` — symlinked to `~/.config/starship.toml`
- `git/gitconfig` — symlinked to `~/.gitconfig` (identity, gh credential helper)

## Everyday

- `mise bootstrap status` — what differs from the config
- `mise bootstrap packages use -g brew:<formula>` / `brew-cask:<app>` — add a package
- `mise use -g <tool>@<version>` — add a runtime
