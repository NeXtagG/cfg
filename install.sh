#!/usr/bin/env bash
# Установка cfg + cfg-gui в ~/.local/bin и ярлык «Конфиги» в меню. Запуск:  bash install.sh
set -euo pipefail

HERE="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
BIN="$HOME/.local/bin"

install -Dm755 "$HERE/cfg" "$BIN/cfg"
install -Dm755 "$HERE/cfg-gui" "$BIN/cfg-gui"

mkdir -p "$HOME/.local/share/applications"
cat > "$HOME/.local/share/applications/dev.nextagg.Cfg.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Конфиги
GenericName=Редактор конфигов
Comment=Найти любой конфиг и открыть его в nano / sudo nano
Exec=$BIN/cfg-gui %U
Icon=configurator-app
Terminal=false
Categories=System;Settings;
Keywords=config;conf;nano;sudo;etc;dotfiles;конфиг;настройки;
StartupWMClass=dev.nextagg.Cfg
EOF

echo "Готово: cfg (терминал) и «Конфиги» в меню."
command -v fzf >/dev/null || echo "Для cfg в терминале нужен fzf: sudo pacman -S fzf"
