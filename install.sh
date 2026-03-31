#!/bin/bash
# install.sh — Copy global OpenCode config, AGENTS.md, commands, and templates
# Run from the repo root: ./install.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OPENCODE_DIR="$HOME/.config/opencode"
MODE="prompt"

case "${1:-}" in
  --sync)
    MODE="sync"
    ;;
  --verify)
    MODE="verify"
    ;;
  "")
    ;;
  *)
    echo "Usage: ./install.sh [--sync|--verify]"
    exit 1
    ;;
esac

# Copy or verify a managed file.
sync_file() {
  local src="$1"
  local dest="$2"
  local label="$3"

  if [[ "$MODE" == "verify" ]]; then
    if [[ ! -f "$dest" ]]; then
      echo "MISSING  $label"
      return
    fi

    if cmp -s "$src" "$dest"; then
      echo "OK       $label"
    else
      echo "DRIFT    $label"
    fi
    return
  fi

  if [[ -f "$dest" ]]; then
    if [[ "$MODE" == "prompt" ]]; then
      read -r -p "⚠ $label already exists. Overwrite? [y/N] " answer
      if [[ ! "$answer" =~ ^[Yy]$ ]]; then
        echo "  Skipped $label"
        return
      fi
    fi
  fi

  cp "$src" "$dest"
  echo "✓ Copied $label"
}

# Create ~/.config/opencode/ if it doesn't exist
mkdir -p "$OPENCODE_DIR/commands" "$OPENCODE_DIR/templates"

# Copy global opencode.json
sync_file "$SCRIPT_DIR/opencode.json" "$OPENCODE_DIR/opencode.json" "~/.config/opencode/opencode.json"

# Copy global AGENTS.md
sync_file "$SCRIPT_DIR/AGENTS.md" "$OPENCODE_DIR/AGENTS.md" "~/.config/opencode/AGENTS.md"

# Copy each command
command_count=0
shopt -s nullglob
for command_file in "$SCRIPT_DIR"/commands/*.md; do
  command_name=$(basename "$command_file")
  sync_file "$command_file" "$OPENCODE_DIR/commands/$command_name" "command: ${command_name%.md}"
  command_count=$((command_count + 1))
done
shopt -u nullglob

# Copy templates
sync_file "$SCRIPT_DIR/templates/design_system.md" "$OPENCODE_DIR/templates/design_system.md" "~/.config/opencode/templates/design_system.md"

if [[ "$MODE" == "verify" ]]; then
  echo ""
  echo "Verification complete."
elif [[ "$command_count" -eq 0 ]]; then
  echo ""
  echo "No commands found in $SCRIPT_DIR/commands/."
else
  echo ""
  echo "Done. $command_count command(s) processed."
fi

echo ""
echo "To verify manually: ls ~/.config/opencode/commands/"
