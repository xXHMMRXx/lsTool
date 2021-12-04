#!/usr/bin/bash

# Created by xXHMMRXx. Support -> Telegram @xXHMMRXx
# The lsTool is open-sourced software licensed under the GPLv3 license.

# Colors
Cyan='\e[0;36m'
Azul='\e[0;34m'
okegreen='\033[92m'
VerdeClaro='\e[1;32m'
Blanco='\e[1;37m'
RojoClaro='\e[1;31m'
Amarillo='\e[0;33m'
BlueF='\e[1;34m'
RESET='\033[00m'
Naranja='\e[38;5;166m'

spinner01=('\n :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n')
spinner02=('         █████        █████████  ███████████    ███████       ███████    █████       ')
spinner03=('        ░░███        ███░░░░░███░█░░░███░░░█  ███░░░░░███   ███░░░░░███ ░░███        ')
spinner04=('         ░███       ░███    ░░░ ░   ░███  ░  ███     ░░███ ███     ░░███ ░███        ')
spinner05=('         ░███       ░░█████████     ░███    ░███      ░███░███      ░███ ░███        ')
spinner06=('         ░███        ░░░░░░░░███    ░███    ░███      ░███░███      ░███ ░███        ')
spinner07=('         ░███      █ ███    ░███    ░███    ░░███     ███ ░░███     ███  ░███      █ ')
spinner08=('         ███████████░░█████████     █████    ░░░███████░   ░░░███████░   ███████████ ')
spinner09=('        ░░░░░░░░░░░  ░░░░░░░░░     ░░░░░       ░░░░░░░       ░░░░░░░    ░░░░░░░░░░░  \n')
spinner10=(' ::::::::::::::::::::::::::::::' 
' :::::::::::::::::::::::::::::: \e[1;33m>'
' :::::::::::::::::::::::::::::: \e[1;33m>>'
' :::::::::::::::::::::::::::::: \e[1;33m>>> '
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡C'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Cr'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Cre'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Crea'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Creat'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Create'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created '
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created b'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created by '
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created by \e[1;32mx'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created by \e[1;32mxX'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created by \e[1;32mxXH'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created by \e[1;32mxXHM'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created by \e[1;32mxXHMM'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created by \e[1;32mxXHMMR'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created by \e[1;32mxXHMMRX'
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created by \e[1;32mxXHMMRXx\e[1;33m!' 
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created by \e[1;32mxXHMMRXx\e[1;33m! \e[1;33m<' 
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created by \e[1;32mxXHMMRXx\e[1;33m! \e[1;33m<<' 
' :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created by \e[1;32mxXHMMRXx\e[1;33m! \e[1;33m<<< ' 
'\e[1;36m :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created by \e[1;32mxXHMMRXx\e[1;33m!\e[1;36m \e[1;33m<<<\e[1;36m ::::::::::::::::::::::::::::::\e[0m\n\n\n')

# >>> Kali >>>
function kali() {
  read opt
  
  if [ $opt == 1 ]; then
    img=$(zenity --file-filter=""*.png" "*.jpg" "*.jpeg"" --title="Choose Image .PNG or .JPG" --file-selection --filename="/home/"$USER"/" 2>/dev/null)
    if [ $img ]; then
      python3 src/main.py --os 'kali' --option $opt --img $img
    else 
      echo -e '\e[1;31m\n # Please select an image\n\033[00m'
      sleep 3s
      banner02;
      kali;
    fi
  elif [ $opt == 2 ]; then
    python3 src/main.py --os 'kali' --option $opt
  elif [ $opt == 3 ]; then
    main;
  elif [ $opt != 1 ] || [ $opt != 2 ] || [ $opt != 3 ] ; then
    banner02 'kali linux';
    kali;
  fi

}
# <<< Kali <<<

# >>> Select OS >>>
function setOS() {
  read opt 
  if [ $opt == 1 ]; then
    if [ $(uname -n) == 'kali' ] || [ $(uname -n) == 'Kali' ]; then
      banner02 'kali linux';
      kali;
    else
      echo -e '\n\n\e[1;33m # Your operating system is not yet supported, please contact us to add your operating system as soon as possible.\e[0m\n\n\e[1;32m Telegram: @xXHMMRXx \e[0m'
    fi
  elif [ $opt == 2 ]; then
    echo -e '\n\n # GoodBye :D \n'
    exit
  elif [ $opt != 1 ] || [ $opt != 2 ]; then
    main;
  fi
}
# <<< Select OS <<<

# >>> Banner02 >>>
function banner02() {
  clear

  echo -e '\n\e[1;36m :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n'
  echo -e '\e[1;36m         █████        █████████  ███████████    ███████       ███████    █████       '
  echo -e '\e[1;36m        ░░███        ███░░░░░███░█░░░███░░░█  ███░░░░░███   ███░░░░░███ ░░███        '
  echo -e '\e[1;36m         ░███       ░███    ░░░ ░   ░███  ░  ███     ░░███ ███     ░░███ ░███        '
  echo -e '\e[1;36m         ░███       ░░█████████     ░███    ░███      ░███░███      ░███ ░███        '
  echo -e '\e[1;36m         ░███        ░░░░░░░░███    ░███    ░███      ░███░███      ░███ ░███        '
  echo -e '\e[1;36m         ░███      █ ███    ░███    ░███    ░░███     ███ ░░███     ███  ░███      █ '
  echo -e '\e[1;36m         ███████████░░█████████     █████    ░░░███████░   ░░░███████░   ███████████ ' 
  echo -e '\e[1;36m        ░░░░░░░░░░░  ░░░░░░░░░     ░░░░░       ░░░░░░░       ░░░░░░░    ░░░░░░░░░░░  \n'
  echo -e '\e[1;36m :::::::::::::::::::::::::::::: \e[1;33m>>> ¡Created by \e[1;32mxXHMMRXx\e[1;33m!\e[1;36m \e[1;33m<<<\e[1;36m ::::::::::::::::::::::::::::::\e[0m\n\n'

  echo -e '\e[33m # Please select an option. \e[0m\n\n' 
  echo -e $RojoClaro"    [$Blanco"1"$RojoClaro]$okegreen Change background (Image)"
  echo -e $RojoClaro"    [$Blanco"2"$RojoClaro]$okegreen Reset to default settings"
  echo -e $RojoClaro"    [$Blanco"3"$RojoClaro]$okegreen Back"
  echo -e $okegreen"\n\n    ┌─["$RojoClaro"Option$okegreen]──[$RojoClaro~$okegreen]─[\e[1;33m$1$okegreen]:"
          echo -ne $okegreen"    └─────► "

}
# <<< Banner02 <<<

# >>> Banner01 >>>
function banner01() {
  clear

  for i in "${spinner01[@]}" "${spinner02[@]}" "${spinner03[@]}" "${spinner04[@]}" "${spinner05[@]}" "${spinner06[@]}" "${spinner07[@]}" "${spinner08[@]}" "${spinner09[@]}"
    do
      echo -ne $Cyan "\r$i"
      sleep 0.1
      echo ''
    done

  for i in "${spinner10[@]}"
    do
      echo -ne $Cyan "\r$i"
      sleep 0.1
    done

  echo -e '\e[33m # Please select your operating system. \e[0m\n\n' 
  echo -e $RojoClaro"    [$Blanco"1"$RojoClaro]$okegreen Kali Linux"
  echo -e $RojoClaro"    [$Blanco"2"$RojoClaro]$okegreen Exit"
  echo -e $okegreen"\n\n    ┌─["$RojoClaro"Option$okegreen]──[$RojoClaro~$okegreen]─[\e[1;33mOperating System$okegreen]:"
          echo -ne $okegreen"    └─────► "

}
# <<< Banner01 <<<

# >>> Main function >>>
function main() {
  banner01;
  setOS;
}
# <<< Main function <<<

# >>> Initial validator >>>
function validators() {
  if [[ $(id -u) != 0 ]]; then
    echo -e "\n\e[1;33m >>> It's necessary to run the script as root user <<<\e[0m\n\n\e[1;32m $ sudo ./lsTool.sh \e[0m"
    exit
  else 
    if [[ $(grep 'gdm' /etc/X11/default-display-manager) ]]; then
      command -v glib-compile-resources > /dev/null 2>&1 || echo -e '\n\e[1;33m # Installing dependency (libglib2.0-dev-bin). please wait..\n\e[0m' && sudo apt install libglib2.0-dev-bin -y && echo -e '\n\033[1;92m # The installation was completed successfully.\n\e[0m'
      sleep 3s
      main;
    else
      echo -e "\n\e[1;33m >>> Sorry :( <<<\e[0m\n\n\e[1;32m # This script does not yet support desktops other than GNOME, we are still working on adding new features. \e[0m"
      exit
    fi
  fi
}
# <<< Initial validator <<<

validators;