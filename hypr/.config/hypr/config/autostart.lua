-- Auto-start config
-- if you dont use UWSM add your auto start programs here, otherwise use XDG autostart https://wiki.archlinux.org/title/XDG_Autostart

hl.on("hyprland.start", function ()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("xhost +SI:localuser:root")
    hl.exec_cmd("/opt/serpro/tool/assinador-serpro &") -- necessário rodando em background pro e-CAC conseguir assinar
    -- mantém o cursor nativo sincronizado com gsettings (nwg-look não avisa o Hyprland)
    hl.exec_cmd("~/.config/hypr/scripts/cursor-sync.sh &")
end)
