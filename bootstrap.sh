#!/usr/bin/env zsh
# =============================================================================
# bootstrap.sh
# Symlinks dotfiles from this repo into ~/
# Run: ./bootstrap.sh
# Re-running is safe — symlinks are updated in place
# =============================================================================

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"

# Files to symlink into ~/
FILES=(
  .zshrc
  .aliases
  .exports
  .functions
  .gitconfig
  .gitignore_global
)

echo "Symlinking dotfiles from $DOTFILES_DIR to ~/"
echo ""

for file in "${FILES[@]}"; do
  src="$DOTFILES_DIR/$file"
  dest="$HOME/$file"

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    # File exists and is NOT already a symlink — back it up
    echo "  Backing up existing $file → $file.bak"
    mv "$dest" "$dest.bak"
  fi

  ln -sf "$src" "$dest"
  echo "  Linked $file"
done

# Set global gitignore
git config --global core.excludesfile ~/.gitignore_global

echo ""
echo "Done. Reload your shell with: source ~/.zshrc"
echo ""
echo "Next steps:"
echo "  1. Run: brew bundle            (installs everything in Brewfile)"
echo "  2. Run: p10k configure         (set up Powerlevel10k prompt)"
echo "     Note: iTerm2 → Preferences → Profiles → Text → Font → FiraCode Nerd Font"
echo "  3. Run: ./install-claude.sh    (installs Claude Code CLI)"
echo "  4. Create ~/.extra with your git credentials and local overrides"
