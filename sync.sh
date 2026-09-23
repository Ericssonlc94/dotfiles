#!/usr/bin/env bash
# Puxa o estado atual de ~/.config para dentro deste repo de dotfiles.
# Roda a partir de qualquer diretório: cd ~/dotfiles && ./sync.sh
set -euo pipefail

DOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sync_pkg() {
  local pkg="$1" src="$2"; shift 2
  rsync -a --delete --exclude='*.bak.*' "$@" "$src/" "$DOT/$pkg/.config/$pkg/"
}

sync_pkg hypr      "$HOME/.config/hypr"
sync_pkg kitty     "$HOME/.config/kitty"
sync_pkg alacritty "$HOME/.config/alacritty"
sync_pkg btop      "$HOME/.config/btop"
# automacao-etcm.fish e cauc.fish citam projetos/caminhos de trabalho —
# ficam só no sistema local, fora do repo público.
sync_pkg fish      "$HOME/.config/fish" \
  --exclude='functions/automacao-etcm.fish' \
  --exclude='functions/cauc.fish'
cp "$HOME/.config/noctalia/config.toml" "$DOT/noctalia/.config/noctalia/config.toml"

echo "sincronizado. revise com: git -C $DOT status"
