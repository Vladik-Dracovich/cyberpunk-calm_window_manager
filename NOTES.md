# cwm-cyberpunk (neat folder)

This package supports BOTH:
- startx via ~/.xinitrc
- display managers via ~/.xsession

It does this by installing a shared launcher:
  ~/.local/bin/cwm-session

Files in this zip:
- cwm/.cwmrc
- picom/picom.conf
- scripts/dzenbar
- xsession/session.sh        (installed as ~/.local/bin/cwm-session)
- xsession/.xinitrc          (stub that execs cwm-session)
- xsession/.xsession         (stub that execs cwm-session)
- install.sh                 (optional installer with backups)

Keybinds:
- Mod+P        rofi launcher
- Mod+B        toggle dzen bar
- Mod+Shift+B  restart dzen bar
- Mod+C        toggle picom
