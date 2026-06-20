#!/usr/bin/env bash
set -euo pipefail

THEME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NEWAITA="${NEWAITA:-$HOME/.local/share/icons/Newaita-reborn-dark}"
SHADOW="${SHADOW:-$HOME/Documents/Projects/Shadow-Dark-Theme-KDE}"

if [[ ! -d "$NEWAITA" ]]; then
  echo "error: Newaita-reborn-dark not found at $NEWAITA" >&2
  exit 1
fi

if [[ ! -d "$SHADOW/scalable/apps" ]]; then
  echo "error: Shadow Dark apps not found at $SHADOW/scalable/apps" >&2
  exit 1
fi

echo "Syncing Newaita-reborn-dark base..."
rsync -a --delete \
  --exclude 'apps/' \
  --exclude 'build.sh' \
  --exclude 'install.sh' \
  --exclude 'README.md' \
  --exclude '.git/' \
  "$NEWAITA/" "$THEME_DIR/"

echo "Replacing application icons with Shadow Dark..."
for size_dir in "$THEME_DIR/apps"/*/; do
  find "$size_dir" -mindepth 1 -delete
  cp -a "$SHADOW/scalable/apps/." "$size_dir/"
done

sed -i \
  's/^Name=.*/Name=Newaita-Shadow-Dark/' \
  "$THEME_DIR/index.theme"
sed -i \
  's/^Comment=.*/Comment=Newaita-reborn-dark with Shadow Dark application icons/' \
  "$THEME_DIR/index.theme"

echo "Done. Theme ready at $THEME_DIR"
