# Initial setup 
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo echo "fastestmirror=true
deltarpm=true
max_parallel_downloads=10" >> /etc/dnf/dnf.conf

sudo dnf autoremove
sudo dnf clean all
sudo dnf upgrade --refresh
sudo dnf reboot
```
# Install snap
```
sudo dnf install snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
```
# Install codecs
```
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia
```
# Install software
```
sudo dnf copr enable principis/NoiseTorch


sudo dnf install timeshift noisetorch tlp pip gnome-shell-extension-pop-shell
sudo snap install auto-cpufreq

mkdir install_from_git
cd install_from_git


git clone https://github.com/geminis3/envycontrol.git
cd envycontrol
sudo pip install .
cd ..

sudo systemctl enable --now tlp.service
sudo snap run auto-cpufreq --install
sudo tlp start
```
