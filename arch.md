# installing gnome
```
sudo pacman -S nano evince gdm gedit gnome-backgrounds gnome-calculator gnome-control-center gnome-disk-utility gnome-keyring gnome-remote-desktop gnome-shell gnome-shell-extensions gnome-terminal nautilus xdg-user-dirs-gtk gnome-tweaks git bluez

sudo systemctl enable --now gdm.service
sudo systemctl enable --now bluetooth.service
```
# installing yay
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

# installing snap
```
yay -S snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
```
# software
`bauh` - software manager \
`gnome-shell-extension-pop-shell-git` - pop shell tiling manager \
`envycontrol` - change videocards

# commands
`sudo nano /usr/share/X11/xkb/keycodes/evdev` - remap keyboard buttons 52 <-> 118 \
`ln -s redirect_to_file redirect_from_file` -  create redirect
