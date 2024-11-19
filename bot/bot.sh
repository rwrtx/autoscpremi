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
wget https://raw.githubusercontent.com/rwrtx/autoscpremi/main/bot/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear
wget https://raw.githubusercontent.com/rwrtx/autoscpremi/main/bot/kyt.zip
unzip kyt.zip
pip3 install -r kyt/requirements.txt

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
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/kyt/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/kyt/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/kyt/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/kyt/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/kyt/var.txt
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

cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @kyt
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start kyt 
systemctl enable kyt
systemctl restart kyt
clear
loading() {
  local pid=$1
  local delay=0.1
  local spin='-\|/'

  while ps -p "$pid" > /dev/null; do
    printf "[%c] " "$spin"
    spin=${spin#?}${spin%"${spin#?}"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done

  printf "    \b\b\b\b"
}
echo -e " \033[1;97;41m     MENDOWNLOAD ASSET TAMBAHAN......    \033[0m"

sleep 2 & loading $! & wget -q -O /media/log-install.txt "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/ping/log-install.txt"

sleep 2 & loading $! & wget -q -O /usr/bin/addnoobz "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/ping/addnoobz.sh" && chmod +x /usr/bin/addnoobz

sleep 2 & loading $! & wget -q -O /usr/bin/cek-ssh "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/ping/cek-ssh.sh" && chmod +x /usr/bin/cek-ssh

sleep 2 & loading $! & wget -q -O /usr/bin/cek-ss "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/ping/cek-ss.sh" && chmod +x /usr/bin/cek-ss

sleep 2 & loading $! & wget -q -O /usr/bin/cek-tr "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/ping/cek-tr.sh" && chmod +x /usr/bin/cek-tr

sleep 2 & loading $! & wget -q -O /usr/bin/cek-vless "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/ping/cek-vless.sh" && chmod +x /usr/bin/cek-vless

sleep 2 & loading $! & wget -q -O /usr/bin/cek-ws "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/ping/cek-ws.sh" && chmod +x /usr/bin/cek-ws

sleep 2 & loading $! & wget -q -O /usr/bin/del-vless "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/ping/del-vless.sh" && chmod +x /usr/bin/del-vless

sleep 2 & loading $! & wget -q -O /usr/bin/cek-noobz "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/ping/cek-noobz.sh" && chmod +x /usr/bin/cek-noobz

sleep 2 & loading $! & wget -q -O /usr/bin/cek-mws "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/ping/cek-mws.sh" && chmod +x /usr/bin/cek-mws

sleep 2 & loading $! & wget -q -O /usr/bin/cek-mvs "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/ping/cek-mvs.sh" && chmod +x /usr/bin/cek-mvs

sleep 2 & loading $! & wget -q -O /usr/bin/cek-mss "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/ping/cek-mss.sh" && chmod +x /usr/bin/cek-mss

sleep 2 & loading $! & wget -q -O /usr/bin/cek-mts "https://raw.githubusercontent.com/rwrtx/autoscpremi/main/ping/cek-mts.sh" && chmod +x /usr/bin/cek-mts
clear
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
mbot-panel
