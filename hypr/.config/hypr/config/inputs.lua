-- Input configuration

hl.config({
    input = {
        kb_layout = "br",
        kb_variant = "",  -- "br" sem variante = ABNT2

        -- Teclado: velocidade de repeticao ao segurar uma tecla
        repeat_delay = 250,   -- ms ate comecar a repetir (padrao 600 = mais lento p/ comecar)
        repeat_rate  = 40,    -- repeticoes por segundo (padrao 25 = mais devagar)

        -- Mouse: sensibilidade -1.0 (lento) .. 0 (neutro) .. 1.0 (rapido)
        sensitivity   = 0.0,
        accel_profile = "flat",   -- "flat" = sem aceleracao; "adaptive" = curva de aceleracao
        -- force_no_accel = true,  -- ignora totalmente a aceleracao do libinput

        -- Touchpad (notebook)
        touchpad = {
            natural_scroll = true,
            scroll_factor  = 0.5,   -- < 1 rola mais devagar, > 1 mais rapido
            -- tap_button_map = "lrm",
        },
    },
    cursor = {
        -- phinger-cursors-dark não tem manifest hyprcursor; sem isso, Hyprland
        -- não acha o tema e cai no fallback interno (Bibata) a cada boot.
        -- Desligando o hyprcursor, ele usa o XCursor clássico (que já aponta
        -- certo em gsettings/gtk/xsettingsd/uwsm-env).
        enable_hyprcursor = false,
    },
})

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down",       action = "close" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "left",       action = "float" })
