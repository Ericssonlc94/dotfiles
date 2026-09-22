# dotfiles — rice Arch + Hyprland + Noctalia

Config do meu setup: CachyOS/Arch, Hyprland (config em Lua), shell Noctalia (bar/UI),
terminal kitty/alacritty com tema Noctalia, btop com tema Noctalia, fish shell.

## Estrutura

Layout por pacote, compatível com [GNU Stow](https://www.gnu.org/software/stow/)
— cada diretório de topo espelha `$HOME`:

```
dotfiles/
├── hypr/.config/hypr/          # config do Hyprland (Lua, hl.* API) + scripts
├── noctalia/.config/noctalia/  # config.toml da shell Noctalia
├── kitty/.config/kitty/        # kitty.conf + tema noctalia
├── alacritty/.config/alacritty/# alacritty.toml + tema noctalia
├── btop/.config/btop/          # btop.conf + tema noctalia
└── fish/.config/fish/          # config.fish + functions
```

## Instalar num sistema novo

```bash
sudo pacman -S stow
cd ~/dotfiles
stow hypr noctalia kitty alacritty btop fish
```

Isso cria symlinks de cada arquivo para `~/.config/...`. Para desfazer:

```bash
stow -D hypr noctalia kitty alacritty btop fish
```

## Atualizar o repo com mudanças feitas ao vivo

Como os arquivos reais ficam em `~/.config/...` (não symlinks, neste momento),
sincronize manualmente ou rode:

```bash
./sync.sh
```

## Notas

- `hyprland.lua` usa a API `hl.*` (config em Lua, não o `hyprland.conf` tradicional).
- Arquivos `*.bak.*` gerados por edições ao vivo foram deixados de fora de propósito.
- Nenhum segredo/token deve entrar aqui — cheque antes de commitar novos arquivos.
