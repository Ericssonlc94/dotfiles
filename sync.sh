#!/usr/bin/env bash
# Puxa o estado atual de ~/.config para dentro deste repo de dotfiles.
# Roda a partir de qualquer diretório: cd ~/dotfiles && ./sync.sh
set -euo pipefail

DOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sync_pkg() {
  local pkg="$1" src="$2"
  rsync -a --delete --exclude='*.bak.*' "$src/" "$DOT/$pkg/.config/$pkg/"
}

sync_pkg hypr      "$HOME/.config/hypr"
sync_pkg kitty     "$HOME/.config/kitty"
sync_pkg alacritty "$HOME/.config/alacritty"
sync_pkg btop      "$HOME/.config/btop"
sync_pkg fish      "$HOME/.config/fish"
cp "$HOME/.config/noctalia/config.toml" "$DOT/noctalia/.config/noctalia/config.toml"

echo "sincronizado. revise com: git -C $DOT status"
