DESKTOP_ENV=
DESKTOP_ENV_LIST=([0]=hypr [1]=gnome)

current_env()
{
    if [ -z "$DESKTOP_ENV" ]; then
        echo "Available desktop environments:"
        for i in "${!DESKTOP_ENV_LIST[@]}"; do
            echo "  [$i] = ${DESKTOP_ENV_LIST[$i]}"
        done

        while true; do
            read -p "Please choose your desktop env: [0-${#DESKTOP_ENV_LIST[@]}): " var
            if [ "${DESKTOP_ENV_LIST[$var]+abc}" ]; then
                DESKTOP_ENV=${DESKTOP_ENV_LIST[$var]}
                break
            fi
            echo "Invalid number, try again"
        done
    fi
    echo $DESKTOP_ENV
}

init-base()
{
   sudo pacman -S firefox cheese evince file-roller gnome-calculator gparted gnome-keyring gnome-user-share gvfs nautilus sushi mtpfs gvfs-mtp gvfs-gphoto2 git nvidia nvidia-prime bluez android-tools xdg-utils qt5-wayland qt6-wayland
   yay -S gnome-shell-extension-pop-shell-git

   sudo systemctl enable --now bluetooth.service
   sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
}

init-gnome()
{
   sudo pacman -Sy gdm gnome-backgrounds gnome-color-manager gnome-control-center gnome-font-viewer gnome-terminal gnome-menus gnome-remote-desktop gnome-session gnome-settings-daemon gnome-shell gnome-shell-extensions gnome-text-editor mutter gnome-shell-extensions gnome-tweaks
   sudo systemctl enable --now gdm.service
}

init-hypr()
{
   sudo pacman -Sy hyprland sddm kitty xdg-desktop-portal-hyprland polkit-kde-agent mako nwg-look qt5ct qt6ct kvantum waybar cliphist swww hyprlock network-manager-applet blueman pavucontrol
   yay -S tofi hypridle wlogout grimblast


   systemctl enable --now sddm.service
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

    sudo pacman -S flatpak
    yay -S snapd
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap

    printf "Installed: snap, AUR, flatpak \n\n"
}

codecs()
{
    sudo pacman -S vlc
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
    flatpak --user override --filesystem=/home/$USER/.icons/:ro
    sudo flatpak install --user qbittorrent zoom teams_for_linux com.obsproject.Studio onlyoffice xournalpp org.gnome.NetworkDisplays krita typora org.telegram.desktop flatseal
    printf "Installed: additional software\n\n"
}

neovim()
{
    sudo pacman -S zsh neovim go npm gcc fd ripgrep wl-clipboard python-virtualenv kitty
	sudo pacman -S lazygit wget bat git-delta
    sudo pacman -Rsn gnome-terminal
	yay -S oh-my-posh=git
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
