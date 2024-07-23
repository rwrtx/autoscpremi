#!/bin/bash

cd /usr/local/
rm -rf sbin
rm -rf /usr/bin/enc
cd
mkdir /usr/local/sbin
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
clear
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}

res1() {
    wget https://raw.githubusercontent.com/rwrtx/autoscpremi/main/menu/menu.zip
    wget -q -O /usr/bin/enc "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/enc/encrypt" ; chmod +x /usr/bin/enc
    unzip menu.zip
    chmod +x menu/*
    enc menu/*
    enc up.sh
    enc repoid1-setup.sh
    mv menu/* /usr/local/sbin
    mv up.sh /usr/local/sbin
    mv repoid1-setup.sh /usr/local/sbin
    #rm -rf menu
    rm -rf menu.zip
    rm -rf update.sh
    rm -rf up.sh
    rm -rf upd.sh
    
    # Tambahan bagian untuk mengunduh dan mengatur layanan
    REPO="https://raw.githubusercontent.com/rwrtx/autoscpremi/main/config/fv-tunnel/"

    # Download and set permissions for service files
    wget -q -O /etc/systemd/system/limitvmess.service "${REPO}files/limitvmess.service" && chmod +x /etc/systemd/system/limitvmess.service
    wget -q -O /etc/systemd/system/limitvless.service "${REPO}files/limitvless.service" && chmod +x /etc/systemd/system/limitvless.service
    wget -q -O /etc/systemd/system/limittrojan.service "${REPO}files/limittrojan.service" && chmod +x /etc/systemd/system/limittrojan.service
    wget -q -O /etc/systemd/system/limitshadowsocks.service "${REPO}files/limitshadowsocks.service" && chmod +x /etc/systemd/system/limitshadowsocks.service
    wget -q -O /etc/systemd/system/limit-ip.service "${REPO}files/limit-ip.service" && chmod +x /etc/systemd/system/limit-ip.service

    # Download and set permissions for limit scripts
    wget -q -O /etc/xray/limit.vmess "${REPO}files/vmess" && chmod +x /etc/xray/limit.vmess
    wget -q -O /etc/xray/limit.vless "${REPO}files/vless" && chmod +x /etc/xray/limit.vless
    wget -q -O /etc/xray/limit.trojan "${REPO}files/trojan" && chmod +x /etc/xray/limit.trojan
    wget -q -O /etc/xray/limit.shadowsocks "${REPO}files/shadowsocks" && chmod +x /etc/xray/limit.shadowsocks

    # Reload systemd, enable and start services
    systemctl daemon-reload
    systemctl enable --now limitvmess.service
    systemctl enable --now limitvless.service
    systemctl enable --now limittrojan.service
    systemctl enable --now limitshadowsocks.service
    systemctl enable --now limit-ip.service
    systemctl start limit-ip.service
}

netfilter-persistent
clear
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "	██████╗░██████╗░██████╗░░██╗░░░░░░░██╗██████╗░████████╗"
echo -e "	██╔══██╗╚════██╗╚════██╗░██║░░██╗░░██║██╔══██╗╚══██╔══╝"
echo -e "	██████╔╝░█████╔╝░░███╔═╝░╚██╗████╗██╔╝██████╔╝░░░██║░░░"
echo -e "	██╔══██╗░╚═══██╗██╔══╝░░░░████╔═████║░██╔══██╗░░░██║░░░"
echo -e "	██║░░██║██████╔╝███████╗░░╚██╔╝░╚██╔╝░██║░░██║░░░██║░░░"
echo -e "	╚═╝░░╚═╝╚═════╝░╚══════╝░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝░░░╚═╝░░░"
echo -e ""
echo -e "				██╗░░██╗"
echo -e "				╚██╗██╔╝"
echo -e "				░╚███╔╝░"
echo -e "				░██╔██╗░"
echo -e "				██╔╝╚██╗"
echo -e "				╚═╝░░╚═╝"
echo -e ""
echo -e "████████╗██╗░░░██╗███╗░░██╗███╗░░██╗███████╗██╗░░░░░██╗███╗░░██╗░██████╗░"
echo -e "╚══██╔══╝██║░░░██║████╗░██║████╗░██║██╔════╝██║░░░░░██║████╗░██║██╔════╝░"
echo -e "░░░██║░░░██║░░░██║██╔██╗██║██╔██╗██║█████╗░░██║░░░░░██║██╔██╗██║██║░░██╗░"
echo -e "░░░██║░░░██║░░░██║██║╚████║██║╚████║██╔══╝░░██║░░░░░██║██║╚████║██║░░╚██╗"
echo -e "░░░██║░░░╚██████╔╝██║░╚███║██║░╚███║███████╗███████╗██║██║░╚███║╚██████╔╝"
echo -e "░░░╚═╝░░░░╚═════╝░╚═╝░░╚══╝╚═╝░░╚══╝╚══════╝╚══════╝╚═╝╚═╝░░╚══╝░╚═════╝░"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e " \e[1;97;101m.       PROSES UPDATE SCRIPT         \e[0m"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e ""
echo -e "  \033[1;91m Thank you for using the script by : R32WRTxTUNNELING\033[1;37m"
echo -e ""
echo -e "  \033[1;91m Please Wait, The Script Is Currently Updating\033[1;37m"
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e ""
fun_bar 'res1'
echo -e ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu

###########- COLOR CODE -##############
