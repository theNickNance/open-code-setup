#!/bin/bash
# install.sh — Copy global OpenCode config, AGENTS.md, and commands
# Run from the repo root: ./install.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OPENCODE_DIR="$HOME/.config/opencode"

# Prompt before overwriting an existing file. Skips if user declines.
safe_copy() {
  local src="$1"
  local dest="$2"
  local label="$3"

  if [[ -f "$dest" ]]; then
    read -r -p "⚠ $label already exists. Overwrite? [y/N] " answer
    if [[ ! "$answer" =~ ^[Yy]$ ]]; then
      echo "  Skipped $label"
      return
    fi
  fi

  cp "$src" "$dest"
  echo "✓ Copied $label"
}

# Create ~/.config/opencode/ if it doesn't exist
mkdir -p "$OPENCODE_DIR/commands" "$OPENCODE_DIR/templates"

# Copy global opencode.json
safe_copy "$SCRIPT_DIR/opencode.json" "$OPENCODE_DIR/opencode.json" "~/.config/opencode/opencode.json"

# Copy global AGENTS.md
safe_copy "$SCRIPT_DIR/AGENTS.md" "$OPENCODE_DIR/AGENTS.md" "~/.config/opencode/AGENTS.md"

# Copy each command
command_count=0
shopt -s nullglob
for command_file in "$SCRIPT_DIR"/commands/*.md; do
  command_name=$(basename "$command_file")
  safe_copy "$command_file" "$OPENCODE_DIR/commands/$command_name" "command: ${command_name%.md}"
  command_count=$((command_count + 1))
done
shopt -u nullglob

# Copy templates
safe_copy "$SCRIPT_DIR/templates/design_system.md" "$OPENCODE_DIR/templates/design_system.md" "~/.config/opencode/templates/design_system.md"

if [[ "$command_count" -eq 0 ]]; then
  echo ""
  echo "No commands found in $SCRIPT_DIR/commands/."
else
  echo ""
  echo "Done. $command_count command(s) processed."
fi

echo ""
echo "To verify: ls ~/.config/opencode/commands/"
