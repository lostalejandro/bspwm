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
			echo "#--------------------Sistema soportado, la instalación seguirá--------------------#"
			echo ""
			ATUALIZAR
			KSUPERKEY
			I3LOCK
			APPS_XFCE
			PERSONA
		
		elif [[ $ID = "Distributor ID:	Pop" && $RELEASE = "Release:	21.10" ]]; then
			inxi -S
			sleep 2s
			echo "#--------------------Sistema soportado, la instalación seguirá--------------------#"
			echo ""
			ATUALIZAR
			KSUPERKEY
			I3LOCK
			APPS_POP
			PERSONA

		elif [[ $INXI = *Xfce* && "Distributor ID:	Debian" && ($RELEASE = "Release:	testing" || $RELEASE = "Release:	11") ]]; then
			inxi -S
			sleep 2s
			echo "#--------------------Sistema soportado, la instalación seguirá--------------------#"
			echo ""
			ATUALIZAR
			APPS_XFCE
			KSUPERKEY
			I3LOCK
			PERSONA
						
		elif [[ $INXI = *GNOME* && $INXI = *21.10* && $INXI = *Ubuntu* ]]; then
			inxi -S
			sleep 2s
			echo "#---------------------Sistema soportado, la instalación seguirá--------------------#"
			echo ""
			ATUALIZAR
			KSUPERKEY
			I3LOCK
			APPS_POP
			PERSONA
			
		elif [[ $INXI = *GNOME* && "Distributor ID:	Debian" && ($RELEASE = "Release:	testing" || $RELEASE = "Release:	11") ]]; then
			inxi -S
			sleep 2s
			echo "#---------------------Sistema soportado, la instalación seguirá--------------------#"
			echo ""
			ATUALIZAR
			KSUPERKEY
			I3LOCK
			APPS_POP
			PERSONA
		else	
			NOTF_FALHA
			sleep 3
	fi
}

#--Función: Actualizar sistema (base Debian)--#
declare -f ATUALIZAR
function ATUALIZAR(){
			echo "#-----------------------------Actualizar Sistema------------------------------#"
				sudo apt update &&
			echo "#-------------------------Repositorios Actualizados---------------------------#"
			sleep 1s
				sudo apt upgrade -y &&
			echo "#---------------------------Programas Actualizados----------------------------#"
			sleep 1s

			sudo apt dist-upgrade -y && sudo apt autoclean && sudo apt autoremove -y &&
				clear &&
			echo "#-----------------------------Sistema Actualizado-----------------------------#"
				sleep 2s
			BSPWM
		}
			
#--Función: Instalar base BSPWM (base Debian)--#
declare -f BSPWM
function BSPWM()
	{
			echo "#---------------------------Instalando base BSPWM----------------------------#"
				sudo apt install bspwm sxhkd rofi compton polybar dunst -y &&
				clear &&
			echo "#---------------------------Base BSPWM instalada-----------------------------#"
				sleep 2s
			APPS
	}

#--Función: Base Debian - Instalar ksuperkey (hacer posible llamar a rofi con la tecla super)--#
declare -f KSUPERKEY
function KSUPERKEY()
	{
			echo "#----------------------------Habilitar ksuperkey-----------------------------#"
			sudo apt install gcc make libx11-dev libxtst-dev pkg-config -y
			cd /tmp && git clone https://github.com/hanschen/ksuperkey.git
			cd ksuperkey
			make
			sudo make install &&
			clear &&
			echo "#---------------------------Ksuperkey habilitado-----------------------------#"
				sleep 2s
	}
	
#--Función: Base Debian - Instalar i3lock-color (hacer posible bloquear pantalla)--#
declare -f I3LOCK
function I3LOCK()
	{
			echo "#----------------------------Habilitar i3lock--------------------------------#"
			sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxcb-xtest0-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev -y
			cd /tmp && git clone https://github.com/Raymo111/i3lock-color.git
			cd i3lock-color
			./install-i3lock-color.sh &&
			clear &&
			echo "#----------------------------i3lock habilitado-------------------------------#"
				sleep 2s
	}

#--Función: Instalar aplicaciones complementarias (base Debian)--#
declare -f APPS
function APPS()
	{
			echo "#-----------------------Instalar apps complementarias-------------------------#"
			sudo apt install neofetch htop feh lxappearance geany dmenu nm-tray xfconf xsettingsd xfce4-power-manager zenity git -y &&
			clear &&
			echo "#----------------------Apps complementarias instaladas------------------------#"
				sleep 2s
			PERSONA
	}

#--Función: Instalar aplicaciones complementarias en Xubuntu--#
declare -f APPS_XFCE
function APPS_XFCE()
	{
			echo "#------------------Instalar apps complementarias para xfce--------------------#"
			sudo apt install thunar-archive-plugin catfish baobab meld -y &&
			clear &&
			echo "#-------------------------Apps para xfce instaladas---------------------------#"
				sleep 2s
	}
	
#--Función: Instalar aplicaciones complementarias en Pop!OS--#
declare -f APPS_POP
function APPS_POP()
	{
			echo "#------------------------------Apps para Gnome-------------------------------#"
			sudo apt install mate-polkit -y &&
			clear &&
			echo "#-------------------------Apps para Gnome instaladas-------------------------#"
				sleep 2s
	}
	
#--Función: Usar personalizaciones para: fonts, configs, iconos, temas, polybar, dunst y rofi--#
declare -f PERSONA
function PERSONA()
	{
			echo "#----------------Copiar personalizaciones (icones, temas, fonts y fondos)--------------#"
				cd /tmp && git clone https://github.com/lostalejandro/bspwm && chmod 755 bspwm/* -R
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
				cp -rf /tmp/bspwm/home/.zshrc $HOME
				cp -rf /tmp/bspwm/home/.zshenv $HOME
				cp -rf /tmp/bspwm/home/.p10k.zsh $HOME
				cp -rf /tmp/bspwm/home/.fehbg $HOME
				
			clear &&
			echo "#---------------------Personalizaciones principales copiadas-----------------------#"
				sleep 3s
			clear
			NOTF_SUCCESS
	}
	
#--Función: Notificar operacion exitosa--#
declare -f NOTF_SUCESS
function NOTF_SUCESS()
	{
		zenity --info --width 300 --text "Instalación exitosa. Para que todo funcione correctamente, es recomendable que reinicie su sistema."
	}
	
#--Función: Notificar Falha na operação--#
declare -f NOTF_FALHA
function NOTF_FALHA()
	{
		clear
		echo "#---------------------------Sistema no sportado-------------------------------#"
		echo "#--------Este script fue diseñado para correr en las siguientes distros:------#"		
		echo "#-----------------Debian Bullseye o Bookworm (xfce y gnome)-------------------#"
		echo "#------------------------------Pop!_Os 21.04----------------------------------#"
		echo "#--------------------------Ubuntu o Xubuntu 21.10-----------------------------#"
		echo "#-En caso que esté usando una de las mencionadas, debe tener 'inxi' instalado-#"
	}
		
##--------------------------------Funciones utilizadas en el script--------------------------------##
	clear
		echo "#---------------Este asistente instalará bspwm en su máquina---------------#"
	VERIF_DISTRIB
