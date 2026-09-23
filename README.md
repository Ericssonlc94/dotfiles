# dotfiles — September Noctalia
Config do meu setup: CachyOS/Arch, Hyprland (config em Lua), shell Noctalia (bar/UI), terminal kitty/alacritty com tema Noctalia, btop com tema Noctalia, fish shell.

<img width="1920" height="1080" alt="satty-2026-09-23_11:36:46" src="https://github.com/user-attachments/assets/30f8ef70-c2f1-4478-8a2a-3e64ceb9fb4e" />

<img width="1920" height="1080" alt="satty-2026-09-23_11:43:00" src="https://github.com/user-attachments/assets/d6cbb2b8-23e0-4ea0-ac9a-e76dff2539e7" />

## Atalhos inspirados no Omarchy Quattro (keyboard friendly)
Na imagem abaixo, prévia dos atalhos do sistema (abre com sudo + alt + k)

<img width="1090" height="853" alt="satty-2026-09-23_11:43:39" src="https://github.com/user-attachments/assets/d756240f-bcbf-4a18-808d-312580a2ae3e" />


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
