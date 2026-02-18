#!/bin/sh
# (session) — shared startup for both startx (~/.xinitrc) and display managers (~/.xsession)

nitrogen --restore &

picom --config "$HOME/.config/picom/picom.conf" &

trayer \
  --edge top --align right \
  --widthtype request --padding 4 \
  --SetDockType true --SetPartialStrut true \
  --transparent true --alpha 0 \
  --height 20 &

"$HOME/.local/bin/dzenbar" &

exec cwm
