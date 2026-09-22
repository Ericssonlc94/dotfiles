#!/usr/bin/env bash
# Mantém o cursor nativo do Hyprland sincronizado com o gsettings.
# nwg-look (e qualquer outro app) só escreve gsettings/gtk/xsettingsd — nada
# avisa o Hyprland pra recarregar o cursor ao vivo. Este script assina as
# mudanças de cursor-theme/cursor-size e dispara `hyprctl setcursor`.
set -euo pipefail

sync_cursor() {
    local theme size
    theme=$(gsettings get org.gnome.desktop.interface cursor-theme | tr -d "'")
    size=$(gsettings get org.gnome.desktop.interface cursor-size)
    hyprctl setcursor "$theme" "$size" >/dev/null
}

# aplica uma vez ao iniciar, cobre o caso do boot (hyprcursor sem manifest
# pro phinger cai no fallback interno antes deste script rodar)
sync_cursor

gsettings monitor org.gnome.desktop.interface | while read -r line; do
    case "$line" in
        cursor-theme:*|cursor-size:*)
            sync_cursor
            ;;
    esac
done
