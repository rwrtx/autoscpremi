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
    wget https://raw.githubusercontent.com/rwrtx/autoscpremi/main/bot/kyt.zip
    wget https://raw.githubusercontent.com/rwrtx/autoscpremi/main/bot/bot.zip
    wget https://raw.githubusercontent.com/rwrtx/autoscpremi/main/bot/bot.sh
    wget -q -O /usr/bin/enc "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/enc/encrypt" ; chmod +x /usr/bin/enc
    unzip menu.zip
    chmod +x menu/*
    systemctl stop kyt
    sleep 3
    systemctl restart kyt
	unzip kyt.zip
	chmod +x kyt/modules/*
 	uncip bot.zip
  	chmod +x bot/*
 	enc menu/*
  	enc up.sh
   	enc repoid1-setup.sh
    mv menu/* /usr/local/sbin
    mv up.sh /usr/local/sbin
    mv repoid1-setup.sh /usr/local/sbin
    #rm -rf menu
    rm -rf bot.sh
    rm -rf kyt.zip
    rm -rf bot.zip
    rm -rf menu.zip
    rm -rf update.sh
    rm -rf up.sh
    rm -rf upd.sh
    wget -qO- fv-tunnel "https://raw.githubusercontent.com/rwrtx/autoscmain/main/config/fv-tunnel" 
    chmod +x fv-tunnel 
    bash fv-tunnel
    rm -rf fv-tunnel
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
