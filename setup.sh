#if [ $EUID != 0 ]; then
#    sudo -s "$0" "$@"
#    exit $?
#fi

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
    sudo ./$distr_script init

fi
# remap keyboard
if ask_to_run "Swap insert and z keys"; then

    sudo sed -i 's/118/TO_CHANGE/g' /usr/share/X11/xkb/keycodes/evdev
    sudo sed -i 's/52/118/g' /usr/share/X11/xkb/keycodes/evdev
    sudo sed -i 's/TO_CHANGE/118/g' /usr/share/X11/xkb/keycodes/evdev
fi

if ask_to_run "Install additional package managers"; then
    sudo ./$distr_script package_managers
fi


if ask_to_run "Install codecs"; then
    sudo ./$distr_script codecs
fi


if ask_to_run "Optimize battery life"; then
    sudo ./$distr_script battery
    
    yes | cp -rf tlp.conf /etc
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
    sudo ./$distr_script neovim
    cp -r nvim/ ${HOME}/.config
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    nvim -c PackerSync
fi

if ask_to_run "Install postgresql"; then
    sudo ./$distr_script postgres
    
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
    sudo ./$distr_script software
fi
if ask_to_tun "Install theme, icons and font"; then
    sudo ./$distr_script theme
    
    mkdir from_git
    cd from_git

    git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
    ./Graphite-gtk-theme/install.sh --tweaks nord
    ./Graphite-gtk-theme/other/grub2/install.sh

    git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
    ./Tela-circle-icon-theme/install.sh -a

    rm -R from_git
    cd ..
    mkdir ~/.fonts
    cp fonts/* ~/.fonts/
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
