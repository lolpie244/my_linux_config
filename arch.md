# installing gnome
```
sudo pacman -S nano evince gdm gedit gnome-backgrounds gnome-calculator gnome-control-center gnome-disk-utility gnome-keyring gnome-remote-desktop gnome-shell gnome-shell-extensions gnome-terminal nautilus xdg-user-dirs-gtk xdg-user-dirs-portal gnome-tweaks git bluez nvidia nvidia-prime

sudo systemctl enable --now gdm.service
sudo systemctl enable --now bluetooth.service
```
# installing yay
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```
# software from aur
```
yay -S noisetorch switcheroo-control auto-cpufreq tlpui bauh

sudo systemctl enable --now switcheroo-control.service
sudo systemctl enable --now auto-cpufreq
sudo systemctl enable --now tlp.service
sudo tlp start
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
# IDE
```
yay -S clion rider
sudo pacman -S gcc dotnet-sdk dotnet-runtime mono
```
# commands
`sudo nano /usr/share/X11/xkb/keycodes/evdev` - remap keyboard buttons 52 <-> 118 \
`ln -s redirect_to_file redirect_from_file` -  create redirect

