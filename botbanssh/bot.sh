#!/bin/bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# System Request : Debian 9+/Ubuntu 18.04+/20+
# Develovers     » R32WRT_STORE
# telegram       » https://t.me/R32WRT_STORE
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# R32WRTx TUNNELING
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
#color
grenbo="\e[92;1m"
NC='\e[0m'
#install
apt update && apt upgrade
apt install python3 python3-pip git
cd /usr/bin
wget https://raw.githubusercontent.com/rwrtx/autoscpremi/main/botbanssh/xbot.zip
unzip xbot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf xbot.zip
clear
wget https://raw.githubusercontent.com/rwrtx/autoscpremi/main/botbanssh/xkyt.zip
unzip xkyt.zip
pip3 install -r xkyt/requirements.txt

clear
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m           » TAMBAH BOT PANEL «           \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[»] Creat Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[»] Info Id Telegram : @MissRose_bot${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -e -p "[»] Input your Bot Token   : " bottoken
read -e -p "[»] Input Your Id Telegram : " admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/xkyt/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/xkyt/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/xkyt/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/xkyt/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/xkyt/var.txt
clear

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/bot/${bottoken}
fi
DATADB=$(cat /etc/bot/.bot.db | grep "^#bot#" | grep -w "${bottoken}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/bot/.bot.db
fi
echo "#bot# ${bottoken} ${admin}" >>/etc/bot/.bot.db
clear

cat > /etc/systemd/system/xkyt.service << END
[Unit]
Description=Simple xkyt - @xkyt
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m xkyt
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start xkyt 
systemctl enable xkyt
systemctl restart xkyt
cd /root
rm -rf kyt.sh
echo "Input Data Berhasil Diproses!"
echo "Your Data Bot Telegram"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Token Bot      : $bottoken"
echo "Admin          : $admin"
echo "Domain         : $domain"
# echo "Pub            : $PUB"
# echo "Host           : $NS"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Setting Bot Success!"
sleep 2
clear

echo "Installations complete, type /menu on your bot"
read -p "Press Enter Back To menu"
menu
