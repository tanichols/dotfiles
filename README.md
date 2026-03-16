# dotfiles

Personal macOS dotfiles for zsh + Oh My Zsh. Built from scratch for a homelab-oriented dev environment.

## Fresh Mac Setup

### 1. Prerequisites
Attempting to install homebrew on a new Mac will trigger the download and installation of macos developer tools. I recommend simply opening a terminal and issuing the `git` command, which will prompt for the download and install. Once that's complete, continue with the prerequisites.

Install these manually before running bootstrap:
- [Homebrew](https://brew.sh)
- [Oh My Zsh](https://ohmyz.sh)
- Git (`brew install git`)
- SSH key (`ssh-keygen -t ed25519 -C "your@email.com"`)

### 2. Clone the repo
```zsh
git clone git@github.com:tanichols/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Bootstrap
```zsh
chmod +x bootstrap.sh
./bootstrap.sh
```

This symlinks all dotfiles into `~/`. Re-running is safe.

### 4. Install Homebrew packages
```zsh
brew bundle
```

### 5. Create `~/.extra`
Copy the template and fill in your details:
```zsh
cp .extra.template ~/.extra
```

Edit `~/.extra` with your git identity and any machine-specific config. This file is never committed.

### 6. Apply macOS defaults (optional, review first)
```zsh
source .macos
```

⚠️ Read through `.macos` carefully before running — it changes many system settings.

### 7. Reload shell
```zsh
source ~/.zshrc
```

---

## Structure

| File | Purpose |
|---|---|
| `.zshrc` | Oh My Zsh config, theme, plugins |
| `.aliases` | Shell aliases |
| `.exports` | PATH and environment variables |
| `.functions` | Shell functions |
| `.gitconfig` | Git preferences and aliases |
| `.gitignore_global` | Global gitignore for all repos |
| `.macos` | macOS system defaults |
| `Brewfile` | All Homebrew packages and casks |
| `bootstrap.sh` | Symlinks dotfiles into `~/` |
| `.extra.template` | Template for `~/.extra` (never committed) |

---

## Theme

Theme is set to `robbyrussell` by default. Update `ZSH_THEME` in `.zshrc` when ready.

Popular options:
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) — install via `brew install powerlevel10k`, uncomment in Brewfile
- [Starship](https://starship.rs) — cross-shell, configure via `~/.config/starship.toml`

A Nerd Font is required for most themes — uncomment your preferred font in the Brewfile.

---

## Adding a new machine

1. Clone repo
2. Run `./bootstrap.sh`
3. Run `brew bundle`
4. Create `~/.extra` from template
