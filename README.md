# My Debian KDE Config

## Skip GRUB:
  `sudo nano /etc/default/grub`\
  add:
    ```
GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=0```\
  then run:\
  `sudo update-grub`
## Applications:
  - Lazygit
  - Firefox + Waterfox
## Shortcuts:
  - Super + p -> toggle displays overlay (built-in in KDE)
  - Super + q -> close window
  - Super + b -> open firefox
  - Super + w -> open waterfox
  - Super + e -> open file manager (built-in in KDE)
  - Super + Enter -> open console
  - Super + PgUp -> maximize window (built-in in KDE)
  - Super + PgDown -> minimize window (built-in in KDE)
  - Super + a -> Open application menu (KRunner in KDE)
  - Super + d -> Show desktop
  - Super + Shift + e -> Show logout screen
  - Print -> Copy full screen
  - Shift + Print -> Copy rectangular selection
## Themes:
  - Colors: Breeze Dark
  - Night Light: Always on night light, 3,000K
  - Application style: Breeze
  - Plasma style: Breeze Dark
  - Window decorations: Breeze (with action buttons hidden)
  - Icons: Newaita-Shadow-Dark (my "custom" icon pack, with Newaita Dark icons + applications icons from Shadow icons)
  - Cursors: Bibata-Modern-Ice
  - System Sounds: FreeDesktop (Oxygen is ok too, never Ocean (sound feedback when changing volume too loud))
  - Splash screen: Illusion
  - Login Screen: Breeze
## .bashrc aliases:
```
# git alias
alias gs-="git status"
alias gd-="git diff --ignore-all-space"
alias ga-="git add"
alias gco-="git commit"
alias gps-="git push"
alias gpl-="git pull"
alias gl-="lazygit log"
```
## Configuring REAPER audio devices:
  Find where reaper is:\
  `find ~/.local/share/applications /usr/share/applications -name "*reaper*" 2>/dev/null`\
  then change the line starting with ` Exec= ` to\
  `bash -c 'pw-jack /opt/REAPER/reaper'`\
  (we need to run pw-jack + reaper for reaper to connect to pipewire devices)
  Then reboot computer

## Setting audio interface as default:
If JACK can't connect / no audio inputs in Reaper\
Check what PipeWire sees:\
```wpctl status```\
Look under Sources for your audio interface. Note its ID number (the number at the start of the line).\
Set it as the default source (replace 52 with the actual ID):\
```wpctl set-default 52```\
Verify the * asterisk moved to your interface:\
```wpctl status | grep -A10 "Sources"```
