#!/usr/bin/env bash
set -euo pipefail

THEME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_NAME="Newaita-Shadow-Dark"
TARGET="$HOME/.local/share/icons/$THEME_NAME"

mkdir -p "$HOME/.local/share/icons"
ln -sfn "$THEME_DIR" "$TARGET"

echo "Installed $THEME_NAME -> $TARGET"
echo "Select '$THEME_NAME' in your icon theme settings."
