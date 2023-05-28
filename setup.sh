#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
Blink='\e[5m'
yell='\e[33m'
lgreen='\e[92m'
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
clear
if [ -f "/etc/vps/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
clear
echo ""
echo ""
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[0;100;33m        • AutoScript by Nasvpn •            0m"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[92m  _____    ______   _   _    ____    _    _    ____    _____  "
echo -e "\e[92m |  __ \  |  ____| | \ | |  / __ \  | |  | |  / __ \  |  __ \ "
echo -e "\e[92m | |__) | | |__    |  \| | | |  | | | |__| | | |  | | | |__) |"
echo -e "\e[92m |  ___/  |  __|   | . | | | |  | | |  __  | | |  | | |  ___/ "
echo -e "\e[92m | |      | |____  | |\  | | |__| | | |  | | | |__| | | |     "
echo -e "\e[92m |_|      |______| |_| \_|  \____/  |_|  |_|  \____/  |_|     "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "" 
echo -e "$green               Telegram:$NC $red@nasririwat             $NC"
echo -e "$green        Script Version:$NC $red VERSI Freemium         $NC"
echo ''
echo -e "$green              Proses akan mula dalam 5 Saat!            $NC"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 5
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green Sila Masukkan Sub Domain (sub.yourdomain.com) $NC"
echo -e "$green Jika tiada Sila [ Ctrl+C ] • To-Exit $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p " Hostname / Domain: " host
mkdir -p /etc/vps
mkdir -p /etc/vps/xray
mkdir -p /etc/vps/v2ray
mkdir -p /etc/vps/tls
mkdir -p /etc/vps/config-url
mkdir -p /etc/vps/config-user
mkdir -p /etc/vps/xray/conf
mkdir -p /etc/vps/v2ray/conf
mkdir -p /etc/systemd/system/
mkdir -p /var/log/xray/
mkdir -p /var/log/v2ray/
mkdir /var/lib/premium-script;
touch /etc/vps/xray/clients.txt
touch /etc/vps/v2ray/clients.txt
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /etc/vps/xray/domain
echo "$host" >> /root/domain
echo "LONAK" >> /home/version
echo "@IanVPN" >> /home/contact
clear
secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green     Sila Tunggu sebentar             $NC"
echo -e "$gree Process Update & Upgrade Sedang Dijalankan  $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
apt-get update && apt-get upgrade -y && update-grub -y
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green  Process Update&Upgrade Selesai        $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green Installing AutoScript Nasvpn        $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
#install ssh ovpn
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install SSH OVPN               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
wget https://raw.githubusercontent.com/nasvpn/vps/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
#install ssr
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install SSR                $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
wget https://raw.githubusercontent.com/nasvpn/vps/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/nasvpn/vps/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#install wireguard
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green        Install Wireguard              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
wget https://raw.githubusercontent.com/nasvpn/vps/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install v2ray
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green  ISSUE CERT & Install TROJAN GFW       $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
wget https://raw.githubusercontent.com/nasvpn/vps/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
#Instal Xray
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install XRAY              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
wget https://raw.githubusercontent.com/nasvpn/vps/main/xray-go.sh && chmod +x xray-go.sh && screen -S xray-go ./xray-go.sh
#Instal Xray
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green           Install V2RAY              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
wget https://raw.githubusercontent.com/nasvpn/vps/main/v2ray-go.sh && chmod +x v2ray-go.sh && screen -S v2ray-go ./v2ray-go.sh
#set backup
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green            SET BACKUP               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
wget https://raw.githubusercontent.com/nasvpn/vps/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# install OHP
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install OHP                $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
wget https://raw.githubusercontent.com/nasvpn/vps/main/ohp.sh && chmod +x ohp.sh && screen -S ohp ./ohp.sh

rm -f /root/ssh-vpn.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/wg.sh
rm -f /root/ins-vt.sh
rm -f /root/set-br.sh
rm -f /root/xray-go.sh
rm -f /root/v2ray-go.sh
rm -f /root/ohp.sh

cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://ianvpn.xyz

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/nasvpn/vps/main/set.sh"
chmod +x /etc/set.sh
history -c
clear
echo " "
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green  Installation has been completed!!      $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
echo " "
echo -e "\e[33m                                                            \e[0m"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[33m        • AutoScript by Penohop •            "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[92m  _____    ______   _   _    ____    _    _    ____    _____  "
echo -e "\e[92m |  __ \  |  ____| | \ | |  / __ \  | |  | |  / __ \  |  __ \ "
echo -e "\e[92m | |__) | | |__    |  \| | | |  | | | |__| | | |  | | | |__) |"
echo -e "\e[92m |  ___/  |  __|   | . | | | |  | | |  __  | | |  | | |  ___/ "
echo -e "\e[92m | |      | |____  | |\  | | |__| | | |  | | | |__| | | |     "
echo -e "\e[92m |_|      |______| |_| \_|  \____/  |_|  |_|  \____/  |_|     "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo " "
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200"  | tee -a log-install.txt
echo "   - Stunnel4                : 444, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8000 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81, 82"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - XRAY VLESS XTLS SPLICE  : 443"  | tee -a log-install.txt
echo "   - XRAY VLESS XTLS DIRECT  : 443"  | tee -a log-install.txt
echo "   - XRAY VLESS WS TLS       : 443"  | tee -a log-install.txt
echo "   - XRAY TROJAN TLS         : 443"  | tee -a log-install.txt
echo "   - XRAY VMESS TLS          : 443"  | tee -a log-install.txt
echo "   - V2RAY VLESS TLS SPLICE  : 8080" | tee -a log-install.txt
echo "   - V2RAY VLESS TLS DIRECT  : 8080" | tee -a log-install.txt
echo "   - V2RAY VLESS WS TLS      : 8080" | tee -a log-install.txt
echo "   - V2RAY TROJAN TLS        : 8080" | tee -a log-install.txt
echo "   - V2RAY VMESS TLS         : 8080" | tee -a log-install.txt
echo "   - Trojan-GFW              : 2087" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                 : Asia/Kuala_Lumpur (GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                 : [ON]"  | tee -a log-install.txt
echo "   - DDOS Dflate              : [ON]"  | tee -a log-install.txt
echo "   - IPtables                 : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot              : [OFF]" | tee -a log-install.txt
echo "   - IPv6                     : [OFF]" | tee -a log-install.txt
echo "   - Auto-Remove-Expired      : [ON]"  | tee -a log-install.txt
echo "   - Autobackup Data                "  | tee -a log-install.txt
echo "   - AutoKill Multi Login User       " | tee -a log-install.txt
echo "   - Auto Delete Expired Account     " | tee -a log-install.txt
echo "   - Fully automatic script          " | tee -a log-install.txt
echo "   - VPS settings                    " | tee -a log-install.txt
echo "   - Admin Control                   " | tee -a log-install.txt
echo "   - Change port                     " | tee -a log-install.txt
echo "   - Restore Data                    " | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo ""
echo -e "\e[33m━━━━━━━━━[\e[0m \e[32mAllah Maha Besar\e[0m \e[33m]━━━━━━━━━━━\e[0m"
echo ""
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo -e ""
sleep 3
echo -e ""
rm -f /root/setup.sh
rm -f /root/.bash_history
echo -ne "[ ${yell}WARNING${NC} ] Alhamdulillah selesai install (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
exit 0
else
reboot
fi

