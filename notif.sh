#!/bin/bash

# Konfigurasi warna
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"

# Konfigurasi Telegram
BOT_TOKEN="your_bot_token"
CHAT_ID="your_chat_id"

# Fungsi konversi byte
function con() {
    local -i bytes=$1;
    if [[ $bytes -lt 1024 ]]; then
        echo "${bytes}B"
    elif [[ $bytes -lt 1048576 ]]; then
        echo "$(( (bytes + 1023)/1024 ))KB"
    elif [[ $bytes -lt 1073741824 ]]; then
        echo "$(( (bytes + 1048575)/1048576 ))MB"
    else
        echo "$(( (bytes + 1073741823)/1073741824 ))GB"
    fi
}

# Proses data VMess
echo -n > /tmp/other.txt
data=( $(cat /etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq) )

# Pesan notifikasi
notification="<b>🔔 VMess Account Report</b>\n\n"

for akun in "${data[@]}"; do
    if [[ -z "$akun" ]]; then
        akun="tidakada"
    fi

    echo -n > /tmp/ipvmess.txt
    data2=( $(cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq) )
    
    for ip in "${data2[@]}"; do
        jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
        if [[ "$jum" = "$ip" ]]; then
            echo "$jum" >> /tmp/ipvmess.txt
        else
            echo "$ip" >> /tmp/other.txt
        fi
        jum2=$(cat /tmp/ipvmess.txt)
        sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
    done
    
    jum=$(cat /tmp/ipvmess.txt)
    if [[ -n "$jum" ]]; then
        iplimit=$(cat /etc/kyt/limit/vmess/ip/${akun})
        jum2=$(cat /tmp/ipvmess.txt | wc -l)
        byte=$(cat /etc/vmess/${akun})
        lim=$(con ${byte})
        wey=$(cat /etc/limit/vmess/${akun})
        gb=$(con ${wey})
        lastlogin=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 2 | tail -1)

        # Format data untuk notifikasi
        notification+="<b>UserName:</b> ${akun}\n"
        notification+="<b>Last Login:</b> $lastlogin\n"
        notification+="<b>Usage Quota:</b> ${gb}\n"
        notification+="<b>Limit Quota:</b> ${lim}\n"
        notification+="<b>Limit IP:</b> ${iplimit}\n"
        notification+="<b>Login IP:</b> ${jum2}\n\n"
    fi
    
    rm -rf /tmp/ipvmess.txt
done

rm -rf /tmp/other.txt

# Kirim notifikasi ke Telegram
curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
    -d chat_id="${CHAT_ID}" \
    -d text="${notification}" \
    -d parse_mode="HTML" > /dev/null

echo "Notifikasi dikirim."
