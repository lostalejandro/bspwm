<p align="center">
 
[//]: <> (site para ícones: https://shields.io/ )
 
<img alt="Maintained" src="https://img.shields.io/badge/Maintained%3F-Yes-green">
<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/lostalejandro/bspwm">
<img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/lostalejandro/bspwm">
<img alt="Bitbucket open issues" src="https://img.shields.io/bitbucket/issues/lostalejandro/bspwm">
<img alt="GitHub commit activity (branch)" src="https://img.shields.io/github/commit-activity/y/lostalejandro/bspwm">
<a href="#"><img src="https://badges.pufler.dev/visits/lostalejandro/bspwm">

# Sobre

Este script consiste en instalar un Gestor de Ventanas   [bspwm](https://github.com/baskerville/bspwm) junto con [polybar](https://github.com/polybar/polybar) y [rofi](https://github.com/davatorium/rofi).

<hr>

# Instalación

## Base Debian (Debian, Pop!_OS, Ubuntu e Xubuntu)
En su terminal, ejecute el comando de abajo para iniciar la instalación:
```bash
sudo apt install git inxi -y && cd /tmp && git clone https://github.com/lostalejandro/bspwm && chmod 755 bspwm/* -R && cd bspwm/ && ./instalar.sh
```
 
## Fedora
En su terminal, ejecute el comando de abajo para iniciar la instalación:
```bash
sudo dnf install -y git inxi && cd /tmp && git clone https://github.com/lostalejandro/bspwm && chmod 755 bspwm/* -R && cd bspwm/ && ./instalar.sh
```

<hr>

# Sistemas soportados
Para que el script se ejecute correctamente, es necesario tener sistema, versión y DE mostrados abajo:

<table align=center border="1">
    <tr>
        <th>Sistema</td>
        <th>Versión</td>
        <th>DE</td>
    </tr>
    <tr>
        <td align="center"valign="center">Debian</td>
        <td align="center"valign="center">Bullseye o Bookworm</td>
        <td align="center"valign="center">Xfce o GNOME</td>
    </tr>
    <tr>
        <td align="center"valign="center">Fedora</td>
        <td align="center"valign="center">35*</td>
        <td align="center"valign="center">GNOME</td>
    </tr>
    <tr>
        <td>Pop!_OS</td>
        <td rowspan="3" align="center"valign="center">21.10</td>
        <td align="center"valign="center">-</td>
       </tr>
     <tr>
        <td align="center"valign="center">Ubuntu</td>
        <td align="center"valign="center">GNOME</td>
    </tr>
     <tr>
        <td align="center"valign="center">Xubuntu</td>
        <td align="center"valign="center">Xfce</td>
    </tr>
</table>

# Temas y diseños disponibles

## Temas para BSPWM
Utilize el atajo <kbd>Super</kbd> + <kbd>t</kbd> para seleccionar el tema deseado:<br>

![temas](https://user-images.githubusercontent.com/84329097/141335499-8e8b4683-a1d0-4727-9c66-58f3e452f491.gif)

##

## Temas del menu rofi
 
Pudiendo cambiar el color de acuerdo con el tema seleccionado:

![rofi](https://user-images.githubusercontent.com/84329097/141335969-4cc5440c-342c-431b-bd89-693efd947a4a.gif)

<hr>

## Cambio de tema para LightDM

En caso de que el script sea ejecutado en Debian Xfce o en Xubuntu, será modificado el tema del gestor de inicio, quedando así:

![01](https://user-images.githubusercontent.com/84329097/141336377-58b7b39c-62a2-430d-aad8-c7388b7ae75d.png)

Observación: En Xubuntu está configurado para usar el Wallpaper de la sesión en LightDM, con esto usará el Wallpaper de la sesión.

<hr>

# Dependencias

Para que sea realizada una correcta instalación, es necesario tener instalado `inxi` en su sistema, así como también `git`. En caso de que la instalación sea realizada con el comando presentado arriba, todo será instalado automáticamente.

<hr>

# Lo que será instalado
* Paquetes comúnes a todas las distros:

   > bspwm, sxhkd, rofi, compton, polybar, dunst, [ksuperkey](https://github.com/hanschen/ksuperkey), neofetch, htop, feh, lxappearance, geany, dmenu, nm-tray, xfconf, xsettingsd, xfce4-power-manager, zenity, git.

* Paquetes destinados a las distros xfce:

   > thunar-archive-plugin, catfish, baobab, meld, language-selector-gnome* (solo para Xubuntu).

* Paquetes destinados a las distros GNOME:

   > mate-polkit, i3lock.

<hr>

# Atajos de teclado </h2>
Para utilizar *bspwm* notará que muchas veces el teclado es nuestro mejor amigo, por eso, debemos aprender algunos atajos interesantes para darle un mejor uso.

En caso de que quiera personalizar alguno, modifique o elimine las líneas que usted prefiera, puede ser realizado editando el archivo: `~/.config/sxhkd/sxhkdrc`.

Atajos y a configurados:
<br>(Nota: <kbd> Super</kbd> = Tecla Windows)

## Menus
<kbd>Super</kbd> o <kbd>Alt</kbd> + <kbd>F1</kbd> - Menu de aplicaciones <br>
<kbd>Super</kbd> + <kbd>F1</kbd> - Menu de ejecutables <br>
<kbd>Super</kbd> + <kbd>w</kbd> - Muestr losa programas abiertos <br>
<kbd>Super</kbd> + <kbd>x</kbd> - Menu de opciones de apagado <br>
<kbd>Super</kbd> + <kbd>t</kbd> - Selector del tema <br>

## Comandos internos
<kbd>Super</kbd> + <kbd>esc</kbd> - Recargar atajos de teclado (archivo sxhkdrc)<br>
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>r</kbd>- Reiniciar BSPWM<br>

## Aplicaciones
<kbd>Super</kbd> + <kbd>Enter</kbd> - Terminal Alacritty <br>
<kbd>Super</kbd> + <kbd>e</kbd> - Gestor de archivos (thunar)<br>
<kbd>Super</kbd> + <kbd>b</kbd> - Firefox<br>
<kbd>Super</kbd> + <kbd>g</kbd> - Geany<br>
<kbd>Super</kbd> + <kbd>c</kbd> - Cerrar Ventana enfocada <br>

## Áreas de trabajo
<kbd>Super</kbd> + <kbd>1-9</kbd> - Cambio del área de trabajo <br>
<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>←/→</kbd> - Cambio del área de trabajo hacia un lado<br>

## Administrar ventanas
<kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>1-9</kbd> - Envia la ventana enfocada al área de trabajo deseada <br>
<kbd>Super</kbd> + <kbd>Barra espaciadora</kbd> - Cambio entre el modo tiling / floating <br>
<kbd>Super</kbd> + <kbd>Click Izq</kbd> - Permite mover la ventana enfocada en modo tiling / flotaing  <br>
<kbd>Super</kbd> + <kbd>F</kbd> - Coloca la ventana enfocada en Modo ventana completa <br>
<kbd>Super</kbd> + <kbd>H/V/Q</kbd> - Prepara a la división de la ventana en Horizontal, Vertical o Cancela <br>
<kbd>Super</kbd> + <kbd>TAB</kbd> - Vuelve para la última ventana abierta <br>
<kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>←/→/↑ /↓ </kbd> - Expande la ventana enfocada <br>
<kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>←/→/↑ /↓</kbd> - Disminuye la ventana enfocada <br>

<hr>

# Consejos

* [Como configurar a resolução e rotação das telas no BSPWM](https://plus.diolinux.com.br/t/como-configurar-a-resolucao-e-rotacao-das-telas-no-bspwm/37957)
* [Como configurar BSPWM e polybar para mais de um monitor](https://plus.diolinux.com.br/t/como-configurar-bspwm-e-polybar-para-mais-de-um-monitor/35201)

<hr>

# Créditos
Tanto los menus, polybar, temas y configuraciones para bspwm, así como también para sxhkd fueron elaborados por [Aditya Shakya](https://github.com/adi1090x) que disponibilizó en su Github ([polybar](https://github.com/adi1090x/polybar-themes) y [rofi](https://github.com/adi1090x/rofi)), a [William Santos](https://github.com/thespation/) quien creó este excelente script. Y a mi persona [Alejandro Fermín](https://github.com/lostalejandro/) por realizar configuraciones personalizadas, adaptar el script a más distros y por traducir al español.

