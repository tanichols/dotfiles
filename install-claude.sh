#!/usr/bin/env zsh
# =============================================================================
# install-claude.sh
# Installs Claude Code CLI globally via npm
# Run: ./install-claude.sh
# =============================================================================

set -e

# ---------------------------------------------------------------------------
# Ensure npm is available — load nvm if needed
# ---------------------------------------------------------------------------
if ! command -v npm &>/dev/null; then
  # Try loading nvm (Homebrew location)
  NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
  NVM_INIT="/opt/homebrew/opt/nvm/nvm.sh"

  if [[ -s "$NVM_INIT" ]]; then
    echo "npm not found in PATH — loading nvm..."
    source "$NVM_INIT"
    # Use the default/current node version
    nvm use default 2>/dev/null || nvm use node
  else
    echo "Error: npm not found and nvm is not installed."
    echo "Install Node via: brew install nvm  (then: nvm install --lts)"
    exit 1
  fi
fi

# ---------------------------------------------------------------------------
# Install / update Claude Code
# ---------------------------------------------------------------------------
echo "Installing Claude Code..."
npm install -g @anthropic-ai/claude-code

echo ""
echo "Done. Verify with: claude --version"
echo "Get started:       claude"
