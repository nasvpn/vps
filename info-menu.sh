#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear
sttt=`cat /root/log-install.txt`
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
echo -e "\e[33m                                                            \e[0m"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[33m        • AutoScript by NASVPN •            "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[92m  _____    ______   _   _    ____    _    _    ____    _____  "
echo -e "\e[92m |  __ \  |  ____| | \ | |  / __ \  | |  | |  / __ \  |  __ \ "
echo -e "\e[92m | |__) | | |__    |  \| | | |  | | | |__| | | |  | | | |__) |"
echo -e "\e[92m |  ___/  |  __|   | . | | | |  | | |  __  | | |  | | |  ___/ "
echo -e "\e[92m | |      | |____  | |\  | | |__| | | |  | | | |__| | | |     "
echo -e "\e[92m |_|      |______| |_| \_|  \____/  |_|  |_|  \____/  |_|     "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "" 
echo -e ":

   Isp Name : $ISP
   City     : $CITY
   Time     : $WKT
   IPVPS    : $IPVPS
   
\033[1;33mScript hanya tujuan pembelajaran\e[0m
"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m
\033[1;32mPort Information\e[0m :

$sttt

\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m

[\033[0;32m01\e[0m] • Show VPS Informatin

[00] • Back to Main Menu \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo ""
echo -ne "Select menu : "; read x

case "$x" in 
   1 | 01)
   clear
   vpsinfo
   read -n 1 -s -r -p "Press any key to back on menu"
   info-menu
   ;;
   
   0 | 00)
   clear
   menu
   ;;
   *)
   info-menu
esac

#fim