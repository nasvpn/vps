#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
clear 
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m      • TROJAN GFW MENU •          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""  
echo -e " [\e[36m•1\e[0m] Create Trojan Account"
echo -e " [\e[36m•2\e[0m] Deleting Trojan Account"
echo -e " [\e[36m•3\e[0m] Renew Trojan Account"
echo -e " [\e[36m•4\e[0m] Check User Login Trojan"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-tr ;;
2) clear ; del-tr ;;
3) clear ; renew-tr ;;
4) clear ; cek-tr ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Wrong Number" ; sleep 1 ; m-trojan ;;
esac