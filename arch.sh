init()
{
   sudo pacman -S firefox cheese evince file-roller gdm gnome-backgrounds gnome-calculator gnome-color-manager gnome-control-center gnome-disk-utility gnome-font-viewer gnome-keyring gnome-menus gnome-remote-desktop gnome-session gnome-settings-daemon gnome-shell gnome-shell-extensions gnome-text-editor gnome-user-share gvfs mutter nautilus sushi totem xdg-user-dirs-gtk gnome-shell-extensions gnome-terminal gnome-tweaks git nvidia nvidia-prime bluez

   sudo systemctl enable --now gdm.service
   sudo systemctl enable --now bluetooth.service
   sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
}

package_managers()
{
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si

    sudo pacman -S flatpak
    yay -S snapd bauh
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
    
    printf "Installed: snap, AUR, flatpak \n\n"
}

codecs() 
{
    sudo pacman -S vlc nomacs
    sudo pacman -S jasper lame libdca libdv gst-libav libtheora libvorbis libxv wavpack x264 xvidcore dvd+rw-tools dvdauthor dvgrab libmad libmpeg2 libdvdcss libdvdread libdvdnav exfat-utils fuse-exfat a52dec faac faad2 flac
    
    printf "Installed: codecs\n\n"
}


battery() 
{
    sudo pacman -S tlp
    sudo systemctl enable --now tlp.service
    sudo tlp start

    yay -S envycontrol auto-cpufreq switcheroo-control
    sudo systemctl enable --now switcheroo-control.service
    systemctl enable --now auto-cpufreq.service
    

    printf "Installed: tlp, auto-cpufreq, envycontrol\n\n"
}

software() 
{
    yay -S noisetorch timeshift gnome-shell-extension-pop-shell-git 
    sudo pacman -S gcc dotnet-sdk dotnet-runtime aspnet-runtime mono htop 

    sudo flatpak install qbittorrent zoom teams_for_linux com.obsproject.Studio onlyoffice xournalpp org.gnome.NetworkDisplays krita md.obsidian.Obsidian typora org.telegram.desktop flatseal
    printf "Installed: additional software\n\n"
}

neovim() 
{
    sudo pacman -S neovim go npm gcc fd ripgrep
}
postgres() 
{
    sudo pacman -S postgresql
    sudo su - postgres 
    initdb --locale en_US.UTF-8 -D /var/lib/postgres/data
    exit
}
theme()
{
   sudo pacman -S gtk-murrine-engine sassc
   yay -S gnome-browser-connector 
}



case $1 in
    "init") init;;
    "package_managers") package_managers;;
    "codecs") codecs;;
    "battery") battery;;
    "software") software;;
    "neovim") neovim;;
    "postgres") postgres;;
    "theme") theme;;
    *) 
	printf "invalid argument\n"
	exit 1;;
esac
