if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

init()
{
    sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
        sudo echo "fastestmirror=true
deltarpm=true
max_parallel_downloads=10" >> /etc/dnf/dnf.conf

    sudo dnf autoremove
    sudo dnf clean all
    sudo dnf upgrade --refresh

    printf "enabled rpm_fusion, optitimised dnf\n\n"

    printf "set su password:"
    sudo passwd root
}

package_managers()
{
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    sudo dnf install snapd
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap 
    
    printf "enabled flathub, installed snap \n\n"
}

codecs() 
{
    sudo dnf install vlc nomacs
    sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
    sudo dnf install lame\* --exclude=lame-devel
    sudo dnf group upgrade --with-optional Multimedia
    
    printf "codecs installed\n\n"
}


battery() 
{
    sudo dnf install tlp pip
    sudo snap install auto-cpufreq
    git clone https://github.com/geminis3/envycontrol.git

    cd envycontrol
    sudo pip install .
    cd ..

    printf "installed: tlp, auto-cpufreq, envycontrol\n\n"
}

software() 
{
    sudo dnf copr enable principis/NoiseTorch

    sudo dnf install timeshift noisetorch gnome-shell-extension-pop-shell gnome-tweaks gcc gcc-c++ dotnet-sdk-6.0 dotnet-runtime-6.0 mono-devel aspnetcore-runtime-6.0 htop
    sudo flatpak install qbittorrent zoom teams_for_linux com.obsproject.Studio onlyoffice xournalpp org.gnome.NetworkDisplays krita
}

neovim() 
{
    sudo dnf install neovim go npm gcc-c++ fd-find
}
postgres() 
{
    sudo dnf install postgresql-server postgresql-contrib
    sudo systemctl enable postgresql
    sudo postgresql-setup --initdb --unit postgresql
    sudo systemctl start postgresql
    sudo -u postgres psql -c "CREATE USER postgres WITH PASSWORD 'postgres'"
    sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres'"
    sudo sed -i 's/host    all             all             127.0.0.1\/32            ident/host    all             all             127.0.0.1\/32            md5'/g /var/lib/pgsql/data/pg_hba.conf

}
theme()
{
   sudo dnf install gtk-murrine-engine sassc
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
