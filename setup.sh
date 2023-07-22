ask_to_run()
{
    while true; do
	printf "\n=======================================================\n"
	read -p "$1?(y,n): " yn
	case $yn in
	    [Yy]* )
		return 0;;
	    [Nn]* )
		return 1;;
	    * ) echo "Please answer yes or no.";;
	esac
    done
}

distr_list_message="0: arch; 1: fedora"
distr_script_list=([0]="arch.sh" [1]="fedora.sh")


while true; do
    read -p "Write number of your distro: (${distr_list_message[*]}): " dist
    if [ "${distr_script_list[$dist]+abc}" ]; then
	    distr_script=${distr_script_list[$dist]}
	    break
    fi
    echo "Invalid number, try again"

done

chmod +x $distr_script

if ask_to_run "Do init settings"; then
    ./$distr_script init

	echo "
        if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
            export MOZ_ENABLE_WAYLAND=1
        fi" | sudo tee /etc/environment
fi

if ask_to_run "Install additional package managers"; then
    ./$distr_script package_managers
fi

# remap keyboard
if ask_to_run "install remapper"; then
	yay -S input-remapper-git
	sudo systemctl restart input-remapper
	sudo systemctl enable input-remapper
fi

if ask_to_run "Install codecs"; then
    ./$distr_script codecs
fi


if ask_to_run "Optimize battery life"; then
    ./$distr_script battery

    yes | sudo cp -rf tlp.conf /etc
    sudo systemctl enable --now tlp.service
    sudo snap run auto-cpufreq --install
    sudo tlp start
    sudo systemctl mask power-profiles-daemon.service
    sudo systemctl mask systemd-rfkill.service
    sudo systemctl mask systemd-rfkill.socket


    cp -r scripts "$HOME"
    cd
    chmod +x scripts/config
    cd -
fi


if ask_to_run "Install neovim"; then
    ./$distr_script neovim
	sudo ln -s /usr/bin/kitty /usr/bin/gnome-terminal
    cp -r dotfiles/nvim/ ${HOME}/.config
    cp -r dotfiles/kitty/ ${HOME}/.config
    cp -r dotfiles/oh_my_posh_config.json ${HOME}/.config

	echo 'eval "$(oh-my-posh init zsh --config ~/.config/oh_my_posh_config.json)"'>>~/.zshrc
	chsh -s $(which zsh)
fi

if ask_to_run "Install postgresql"; then
    ./$distr_script postgres

    sudo systemctl enable --now postgresql

    if ask_to_run "Install pgadmin"; then
	sudo mkdir /var/lib/pgadmin
	sudo mkdir /var/log/pgadmin

	sudo chown $USER /var/lib/pgadmin
	sudo chown $USER /var/log/pgadmin

	current=`pwd`

	cd
	mkdir ${HOME}/scripts
	mkdir ${HOME}/scripts/pgadmin
	cd scripts/pgadmin
	python3 -m venv venv
	venv/bin/pip install pgadmin4 gevent
	echo "source venv/bin/activate" > pgadmin
	echo "pgadmin4" >> pgadmin
	chmod +x pgadmin

	cd $current
    fi
fi
if ask_to_run "Install other software"; then
    ./$distr_script software
fi
if ask_to_run "Install theme, icons and font"; then
    ./$distr_script theme

    mkdir from_git
    cd from_git

    git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
    ./Graphite-gtk-theme/install.sh --tweaks nord
    ./Graphite-gtk-theme/other/grub2/install.sh

	THEME_DIR="${HOME}/.themes/Graphite-nord"
	mkdir -p                                       "${HOME}/.config/gtk-4.0"
	ln -sf "${THEME_DIR}/gtk-4.0/assets"           "${HOME}/.config/gtk-4.0/assets"
	ln -sf "${THEME_DIR}/gtk-4.0/gtk.css"          "${HOME}/.config/gtk-4.0/gtk.css"
	ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css"     "${HOME}/.config/gtk-4.0/gtk-dark.css"


    git clone https://github.com/arcticicestudio/nord-gnome-terminal
    ./nord-gnome-terminal/src/nord.sh

    git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
    ./Tela-circle-icon-theme/install.sh

    rm -R from_git
    cd ..

	mkdir fonts/jetbrains
	wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip -O jetbrains.zip
	unzip jetbrains.zip -d fonts/jetbrains/
	rm -r jetbrains.zip

    sudo cp -r fonts/* /usr/share/fonts
    sudo fc-cache -f -v
fi

if ask_to_run "Move home folders to hdd"; then

    read -p "Path to hdd: " path

    folders_list=(Documents Pictures Videos Downloads Music)

    cd
    echo $HOME
    for folder in ${folders_list[@]}
    do
	echo `pwd`/$folder
	sudo rm -R $folder
	if ! [ -d ${path}/$folder ]; then
	    mkdir ${path}/$folder
	fi
	ln -s ${path}/$folder $folder
    done
    cd -
fi
