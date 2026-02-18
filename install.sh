#!/bin/sh
set -eu

ts="$(date +%Y%m%d-%H%M%S)"
bkdir="$HOME/.config-backups/$ts"

backup() {
  p="$1"
  if [ -e "$p" ]; then
    mkdir -p "$bkdir"
    mv "$p" "$bkdir/"
  fi
}

echo "[*] Installing cwm + picom + dzen + trayer + rofi config..."

# cwmrc
backup "$HOME/.cwmrc"
cp "cwm/.cwmrc" "$HOME/.cwmrc"

# picom
mkdir -p "$HOME/.config/picom"
backup "$HOME/.config/picom/picom.conf"
cp "picom/picom.conf" "$HOME/.config/picom/picom.conf"

# dzenbar + session
mkdir -p "$HOME/.local/bin"
backup "$HOME/.local/bin/dzenbar"
cp "scripts/dzenbar" "$HOME/.local/bin/dzenbar"
chmod +x "$HOME/.local/bin/dzenbar"

backup "$HOME/.local/bin/cwm-session"
cp "xsession/session.sh" "$HOME/.local/bin/cwm-session"
chmod +x "$HOME/.local/bin/cwm-session"

# xinitrc + xsession stubs
backup "$HOME/.xinitrc"
cp "xsession/.xinitrc" "$HOME/.xinitrc"
chmod +x "$HOME/.xinitrc"

backup "$HOME/.xsession"
cp "xsession/.xsession" "$HOME/.xsession"
chmod +x "$HOME/.xsession"

echo "[*] Done."
echo
echo "Install deps:"
echo "  - cwm rofi nitrogen dzen2 trayer picom"
echo
echo "Use:"
echo "  - startx (uses ~/.xinitrc)"
echo "  - or your display manager (uses ~/.xsession)"
echo
echo "Backups (if any) are in: $bkdir"
