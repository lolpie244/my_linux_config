DESKTOP_ENV=
DESKTOP_ENV_LIST=([0]=hypr [1]=gnome)

current_env()
{
    if [ -z "$DESKTOP_ENV" ]; then
        printf "Available desktop environments:\n" >&2
        for i in "${!DESKTOP_ENV_LIST[@]}"; do
            printf "  [$i] = ${DESKTOP_ENV_LIST[$i]}\n" >&2
        done

        while true; do
            read -p "Please choose your desktop env: [0-${#DESKTOP_ENV_LIST[@]}): " var
            if [ "${DESKTOP_ENV_LIST[$var]+abc}" ]; then
                DESKTOP_ENV=${DESKTOP_ENV_LIST[$var]}
                break
            fi
            printf "Invalid number, try again" >&2
        done
    fi
    echo $DESKTOP_ENV
}

init-base()
{
   sudo pacman -S firefox gdm cheese evince file-roller gnome-calculator gnome-disk-utility gnome-keyring gnome-user-share gvfs nautilus sushi mtpfs gvfs-mtp gvfs-gphoto2 git nvidia nvidia-prime bluez android-tools xdg-utils qt5-wayland qt6-wayland gnome-calendar

   sudo systemctl enable --now bluetooth.service
   sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
   sudo systemctl enable --now gdm.service
}

init-gnome()
{
   sudo pacman -Sy gnome-backgrounds gnome-color-manager gnome-control-center gnome-font-viewer gnome-terminal gnome-menus gnome-remote-desktop gnome-session gnome-settings-daemon gnome-shell gnome-shell-extensions gnome-text-editor mutter gnome-shell-extensions gnome-tweaks
   yay -S gnome-shell-extension-pop-shell-git
}

init-hypr()
{
   sudo pacman -Sy hyprland kitty xdg-desktop-portal-hyprland polkit-gnome mako nwg-look wg-displays qt5ct qt6ct kvantum waybar cliphist swww hyprlock network-manager-applet blueman pavucontrol brightnessctl pamixer xorg-xhost kdeconnect
   yay -S tofi hypridle wlogout grimblast hyprland-per-window-layout
}

init()
{
    init-base
    case $(current_env) in
        "gnome")
            init-gnome
            ;;
        "hypr")
            init-hypr
            ;;
        *)
            echo "No init"
            ;;
    esac
}

package_managers()
{
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si

    sudo pacman -S flatpak python-pipx
    yay -S snapd
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap

    printf "Installed: snap, AUR, flatpak \n\n"
}

codecs()
{
    sudo pacman -S mpv
    yay -S nomacs
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
    yay -S noisetorch timeshift
    sudo pacman -S gcc dotnet-sdk dotnet-runtime aspnet-runtime mono htop feh

    cp /usr/share/icons ~/.icons -r
    flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak --user override --filesystem=/home/$USER/.icons/:ro
    flatpak install --user -y \
        org.qbittorrent.qBittorrent \
        us.zoom.Zoom \
        com.github.IsmaelMartinez.teams_for_linux \
        com.obsproject.Studio \
        org.onlyoffice.desktopeditors \
        com.github.xournalpp.xournalpp \
        org.gnome.NetworkDisplays \
        org.kde.krita \
        io.typora.Typora \
        org.telegram.desktop \
        com.github.tchx84.Flatseal \
        io.github.f3d_app.f3d
    printf "Installed: additional software\n\n"
}

neovim()
{
    sudo pacman -S zsh neovim go npm gcc fd ripgrep wl-clipboard python-virtualenv kitty
	sudo pacman -S lazygit wget bat git-delta tree-sitter-cli
    sudo pacman -Rsn gnome-terminal
	yay -S oh-my-posh=git zsh-fzf-plugin-git
}
postgres()
{
    sudo pacman -S postgresql
    printf "\nInsert: initdb --locale en_US.UTF-8 -D /var/lib/postgres/data; pg_ctl -D /var/lib/postgres/data -l logfile start; exit\n\n"
    sudo su - postgres
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
