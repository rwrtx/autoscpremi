#!/bin/bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# System Request : Debian 9+/Ubuntu 18.04+/20+
# Develovers     » R32WRT_STORE
# telegram       » https://t.me/R32WRT_STORE
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# R32WRTx TUNNELING

clear
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m           » TAMBAH BOT PANEL 2 «           \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;36mTutorial Creat Bot and ID Telegram\033[0m"
echo -e "\033[1;36m[»] Creat Bot and Token Bot : @BotFather\033[0m"
echo -e "\033[1;36m[»] Info Id Telegram : @MissRose_bot\033[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -e -p "[»] Input your Bot Token   : " bottoken2
read -e -p "[»] Input Your Id Telegram : " admin2
echo -e BOT_TOKEN2='"'$bottoken2'"' >> /usr/bin/kyt/var2.txt
echo -e ADMIN2='"'$admin2'"' >> /usr/bin/kyt/var2.txt
clear

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/bot/${bottoken2}
fi
DATADB=$(cat /etc/bot/.bot2.db | grep "^#bot2#" | grep -w "${bottoken2}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/bot/.bot2.db
fi
echo "#bot2# ${bottoken2} ${admin2}" >>/etc/bot/.bot2.db
clear

echo "Input Data Berhasil Diproses!"
echo "Your Data Bot Telegram"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Token Bot      : $bottoken2"
echo "Admin          : $admin2"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Setting Bot 2 Success!"
sleep 2
clear
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
