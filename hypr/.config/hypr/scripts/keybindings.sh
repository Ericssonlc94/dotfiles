#!/usr/bin/env bash
# Mostra/oculta a lista de atalhos (SUPER + ALT + K).
set -euo pipefail

CLASS="hypr-keybindings"
DOC="${HOME}/.config/hypr/keybindings.txt"

# Já aberta? Fecha pelo PID (hyprctl dispatch closewindow não aceita seletor nesta build lua).
pids=$(hyprctl clients -j | jq -r --arg c "$CLASS" '.[] | select(.class == $c) | .pid')
if [ -n "$pids" ]; then
    kill $pids 2>/dev/null || true
    exit 0
fi

exec kitty \
    --class "${CLASS}" \
    --title "Atalhos do teclado" \
    -o background_opacity=1 \
    -o background='#16181d' \
    -o foreground='#ffffff' \
    -o font_size=11 \
    -o cursor_trail=0 \
    -o confirm_os_window_close=0 \
    -- less --mouse --wheel-lines=3 --tilde --clear-screen \
            --prompt=' Atalhos  —  q sai   / busca ' "${DOC}"
