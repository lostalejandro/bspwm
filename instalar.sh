#!/usr/bin/env bash
# Desenvolvido pelo William Santos
# contato: thespation@gmail.com ou https://github.com/thespation
# Traducido y modificado por: Alejandro Fermín https://github.com/lostalejandro

clear
##--------------------------------Funciones utilizadas en el script--------------------------------##
#--Identificar Distribución--#
declare -f VERIF_DISTRIB
function VERIF_DISTRIB()
{	INXI=`inxi -S`
	ID=`lsb_release -i`
	RELEASE=`lsb_release -r`
	if [[ $INXI = *Xfce* && $INXI = *21.10* && $INXI = *Ubuntu* ]]; then
			inxi -S
			sleep 2s
			echo "#-------------------Sistema soportado, la instalación seguirá------------------#"
			echo ""
			ACTUALIZAR
			BSPWM
			KSUPERKEY
			I3LOCK
			ALACC
			ZSH
			PICOM
			APPS
			APPS_XFCE
			PERSONA
		
		elif [[ $ID = "Distributor ID:	Pop" && $RELEASE = "Release:	21.10" ]]; then
			inxi -S
			sleep 2s
			echo "#-------------------Sistema soportado, la instalación seguirá------------------#"
			echo ""
			ACTUALIZAR
			BSPWM
			KSUPERKEY
			I3LOCK
			ALACC
			ZSH
			PICOM
			APPS
			APPS_POP
			PERSONA

		elif [[ $INXI = *Xfce* && "Distributor ID:	Debian" && ($RELEASE = "Release:	testing" || $RELEASE = "Release:	11") ]]; then
			inxi -S
			sleep 2s
			echo "#-------------------Sistema soportado, la instalación seguirá------------------#"
			echo ""
			ACTUALIZAR
			BSPWM
			KSUPERKEY
			I3LOCK
			ALACC
			ZSH
			PICOM
			APPS
			APPS_XFCE
			PERSONA
						
		elif [[ $INXI = *GNOME* && $INXI = *21.10* && $INXI = *Ubuntu* ]]; then
			inxi -S
			sleep 2s
			echo "#-------------------Sistema soportado, la instalación seguirá------------------#"
			echo ""
			ACTUALIZAR
			BSPWM
			KSUPERKEY
			I3LOCK
			ALACC
			ZSH
			PICOM
			APPS
			APPS_POP
			PERSONA
			
		elif [[ $INXI = *GNOME* && "Distributor ID:	Debian" && ($RELEASE = "Release:	testing" || $RELEASE = "Release:	11") ]]; then
			inxi -S
			sleep 2s
			echo "#-------------------Sistema soportado, la instalación seguirá------------------#"
			echo ""
			ACTUALIZAR
			BSPWM
			KSUPERKEY
			I3LOCK
			ALACC
			ZSH
			PICOM
			APPS
			APPS_POP
			PERSONA
			
		elif [[ $INXI = *Arch* ]]; then
			inxi -S
			sleep 2s
			echo "#-------------------Sistema soportado, la instalación seguirá------------------#"
			echo ""
			ACTUALIZAR_ARCH
			BSPWM_ARCH
			ZSH_ARCH
			PICOM_ARCH
			APPS_ARCH
			PERSONA
			
		else	
			NOTF_FALLA
			sleep 3
	fi
}

#--Función: Actualizar sistema (base Debian)--#
declare -f ACTUALIZAR
function ACTUALIZAR(){
			echo "#-----------------------------Actualizar sistema-------------------------------#"
				sudo apt update &&
			echo "#--------------------------Repositorios actualizados---------------------------#"
			sleep 1s
				sudo apt upgrade -y &&
			echo "#---------------------------Programas actualizados-----------------------------#"
			sleep 1s

			sudo apt dist-upgrade -y && sudo apt autoclean && sudo apt autoremove -y &&
				clear &&
			echo "#-----------------------------Sistema actualizado------------------------------#"
				sleep 2s
		}

#--Función: Actualizar sistema (base Arch)--#
declare -f ACTUALIZAR_ARCH
function ACTUALIZAR_ARCH(){
			echo "#-----------------------------Actualizar sistema-------------------------------#"
				sudo pacman -Syyuu --noconfirm &&
				clear &&
			echo "#-----------------------------Sistema actualizado------------------------------#"
				sleep 2s
		}
			
#--Función: Instalar base BSPWM (base Debian)--#
declare -f BSPWM
function BSPWM()
	{
			echo "#----------------------------Instalando base BSPWM-----------------------------#"
				sudo apt install bspwm sxhkd rofi polybar dunst arandr -y &&
				clear &&
			echo "#----------------------------Base BSPWM instalada------------------------------#"
				sleep 2s
	}

#--Función: Instalar base BSPWM (base Arch)--#
declare -f BSPWM_ARCH
function BSPWM_ARCH()
	{
			echo "#----------------------------Instalando base BSPWM-----------------------------#"
				sudo pacman -S bspwm sxhkd rofi dunst xorg-xsetroot arandr --noconfirm &&
				yay -S polybar --noconfirm &&
				clear &&
			echo "#----------------------------Base BSPWM instalada------------------------------#"
				sleep 2s
	}

#--Función: Base Debian - Instalar ksuperkey (hacer posible llamar a rofi con la tecla super)--#
declare -f KSUPERKEY
function KSUPERKEY()
	{
			echo "#-----------------------------Habilitar KSUPERKEY------------------------------#"
			sudo apt install gcc make libx11-dev libxtst-dev pkg-config -y &&
			cd /tmp && git clone https://github.com/hanschen/ksuperkey.git
			cd ksuperkey
			make
			sudo make install &&
			clear &&
			echo "#----------------------------KSUPERKEY habilitado------------------------------#"
				sleep 2s
	}
	
#--Función: Base Debian - Instalar i3lock-color (hacer posible bloquear pantalla)--#
declare -f I3LOCK
function I3LOCK()
	{
			echo "#-----------------------------Habilitar I3LOCK---------------------------------#"
			sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxcb-xtest0-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev -y &&
			cd /tmp && git clone https://github.com/Raymo111/i3lock-color.git
			cd i3lock-color
			./install-i3lock-color.sh &&
			clear &&
			echo "#-----------------------------I3LOCK habilitado--------------------------------#"
				sleep 2s
	}

#--Función: Base Debian - Instalar Alacritty (Terminal)--#
declare -f ALACC
function ALACC()
	{
			echo "#----------------------------Habilitar ALACRITTY-------------------------------#"
			curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh &&
			source $HOME/.cargo/env
			sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y &&
			cd /tmp
			git clone https://github.com/alacritty/alacritty.git &&
			cd /tmp/alacritty
			cargo build --release
			sudo cp /tmp/alacritty/target/release/alacritty /usr/local/bin && 
			cd &&
			cd /tmp/bspwm &&
			sudo cp -rf /tmp/bspwm/apps/Alacritty.desktop /usr/share/applications
			sudo cp -rf /tmp/bspwm/apps/Alacritty.svg /usr/share/pixmaps
			clear &&
			echo "#----------------------------ALACRITTY habilitado------------------------------#"
				sleep 2s
	}
	
#--Función: Base Debian - Instalar ZSH (Terminal)--#
declare -f ZSH
function ZSH()
	{
			echo "#--------------------------------Habilitar ZSH---------------------------------#"
			sudo apt install zsh zplug -y &&
			chsh -s $(which zsh) &&
			sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&
			git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &&
			git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&
			git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
			cd &&
			cp -rf /tmp/bspwm/home/.zshrc $HOME
			cp -rf /tmp/bspwm/home/.p10k.zsh $HOME
			clear &&
			echo "#--------------------------------ZSH habilitado--------------------------------#"
				sleep 2s
	}
	
#--Función: Base Arch - Instalar ZSH (Terminal)--#
declare -f ZSH_ARCH
function ZSH_ARCH()
	{
			echo "#--------------------------------Habilitar ZSH---------------------------------#"
			sudo pacman -S zsh cargo --noconfirm &&
			chsh -s $(which zsh) &&
			sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &&
			cd &&
			yay -S zsh-autosuggestions zsh-completions zsh-syntax-highlighting zsh-theme-powerlevel10k --noconfirm &&
			cp -rf /tmp/bspwm/home/.zshrc $HOME
			cp -rf /tmp/bspwm/home/.p10k.zsh $HOME
			clear &&
			echo "#--------------------------------ZSH habilitado--------------------------------#"
				sleep 2s
	}
	
#--Función: Base Debian - Instalar Picom (Compositor)--#
declare -f PICOM
function PICOM()
	{
			echo "#------------------------------Habilitar PICOM---------------------------------#"
			sudo apt install gcc meson ninja-build python3 cmake pkg-config libpcre3 libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev -y &&
			cd /tmp
			git clone https://github.com/jonaburg/picom
			cd picom
			meson --buildtype=release . build
			ninja -C build
			sudo ninja -C build install
			clear &&
			echo "#------------------------------PICOM habilitado--------------------------------#"
				sleep 2s
	}

#--Función: Base Arch - Instalar Picom (Compositor)--#
declare -f PICOM_ARCH
function PICOM_ARCH()
	{
			echo "#------------------------------Habilitar PICOM---------------------------------#"
			yay -S picom-jonaburg-git --noconfirm &&
			clear &&
			echo "#------------------------------PICOM habilitado--------------------------------#"
				sleep 2s
	}

#--Función: Instalar aplicaciones complementarias (base Debian)--#
declare -f APPS
function APPS()
	{
			echo "#------------------------Instalar apps complementarias-------------------------#"
			sudo apt install neofetch mousepad mpd mpc ncmpcpp cmatrix ranger xbacklight gpick light cava maim bmon nautilus htop feh lxappearance nitrogen geany dmenu nm-tray xfconf xsettingsd xfce4-power-manager zenity git ttf-mscorefonts-installer -y &&
			sudo systemctl disable mpd &&
			clear &&
			echo "#-----------------------Apps complementarias instaladas------------------------#"
				sleep 2s
	}

#--Función: Instalar aplicaciones complementarias (base Arch)--#
declare -f APPS_ARCH
function APPS_ARCH()
	{
			echo "#------------------------Instalar apps complementarias-------------------------#"
			sudo pacman -S alacritty zsh neofetch mousepad chromium mpd mpc ncmpcpp cmatrix ranger xorg-xbacklight gpick light maim bmon nautilus htop feh lxappearance nitrogen geany dmenu networkmanager xfconf xsettingsd xfce4-power-manager zenity git --noconfirm &&
			yay -S i3lock-color ttf-ms-fonts cava nm-tray networkmanager-demnu-git --noconfirm &&
			sudo systemctl disable mpd &&
			clear &&
			echo "#-----------------------Apps complementarias instaladas------------------------#"
				sleep 2s
	}

#--Función: Instalar aplicaciones complementarias en Xubuntu--#
declare -f APPS_XFCE
function APPS_XFCE()
	{
			echo "#-------------------Instalar apps complementarias para XFCE--------------------#"
			sudo apt install catfish baobab meld -y &&
			clear &&
			echo "#--------------------------Apps para XFCE instaladas---------------------------#"
				sleep 2s
	}
	
#--Función: Instalar aplicaciones complementarias en Pop!OS--#
declare -f APPS_POP
function APPS_POP()
	{
			echo "#------------------Instalar apps complementarias para GNOME--------------------#"
			sudo apt install mate-polkit -y &&
			clear &&
			echo "#--------------------------Apps para GNOME instaladas--------------------------#"
				sleep 2s
	}
	
#--Función: Usar personalizaciones para: fonts, configs, iconos, temas, polybar, dunst y rofi--#
declare -f PERSONA
function PERSONA()
	{
			echo "#---------Copiar personalizaciones (iconos, temas, fonts, fondos, etc)---------#"
				cd /tmp/bspwm &&
				sudo cp -r /tmp/bspwm/fonts/* /usr/share/fonts
				sudo cp -r /tmp/bspwm/icons/* /usr/share/icons
				sudo cp -r /tmp/bspwm/themes/* /usr/share/themes
				sudo cp -r /tmp/bspwm/backgrounds/* /usr/share/backgrounds
				cp -rf /tmp/bspwm/home/.config/* ~/.config
				cp -rf /tmp/bspwm/home/.Xresources.d $HOME
				cp -rf /tmp/bspwm/home/.Xresources $HOME
				cp -rf /tmp/bspwm/home/.gtkrc-2.0 $HOME
				cp -rf /tmp/bspwm/home/.xsettingsd $HOME
				cp -rf /tmp/bspwm/home/.dmrc $HOME
				cp -rf /tmp/bspwm/home/.fehbg $HOME
				
			clear &&
			echo "#---------------------Personalizaciones principales copiadas-------------------#"
				sleep 3s
			clear
			NOTF_SUCESS
	}
	
#--Función: Notificar operacion exitosa--#
declare -f NOTF_SUCESS
function NOTF_SUCESS()
	{
		zenity --info --width 300 --text "Instalación exitosa. Para que todo funcione correctamente, es recomendable que reinicie su sistema."
	}
	
#--Función: Notificar Falha na operação--#
declare -f NOTF_FALLA
function NOTF_FALLA()
	{
		clear
			echo "#----------------------------Sistema no soportado------------------------------#"
			echo "#--------Este script fue diseñado para correr en las siguientes distros:-------#"		
			echo "#------------------Debian Bullseye o Bookworm (XFCE y GNOME)-------------------#"
			echo "#-------------------------------Pop!_Os 21.10----------------------------------#"
			echo "#---------------------------Ubuntu o Xubuntu 21.10-----------------------------#"
			echo "#-----------------------------------ArchLinux----------------------------------#"
			echo "#-En caso que esté usando- una de las mencionadas, debe tener 'inxi' instalado-#"
	}
		
##--------------------------------Funciones utilizadas en el script--------------------------------##
	clear
			echo "#------------------Este asistente instalará bspwm en su máquina----------------#"
	VERIF_DISTRIB
