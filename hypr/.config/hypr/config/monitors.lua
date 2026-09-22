-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Saidas e modos: `hyprctl monitors`. Nomes das saidas ficam em variables.lua.
-- Layout esquerda -> direita: MONITOR1 (AOC) em 0x0, MONITOR2 (notebook) a direita.

-- AOC externo, a esquerda, sem escala
hl.monitor({
    output   = MONITOR1,
    mode     = "preferred",
    position = "0x0",
    scale    = "1",
})

-- Notebook (LG), a direita da AOC. AOC tem 1920 de largura logica -> x = 1920.
hl.monitor({
    output   = MONITOR2,
    mode     = "preferred",
    position = "1920x0",
    scale    = "1.5",
})

-- Qualquer outra saida conectada: encaixa automaticamente
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})
