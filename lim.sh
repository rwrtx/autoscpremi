#!/bin/bash

# URL repositori file limit-ip
REPO="https://raw.githubusercontent.com/rwrtx/autoscpremi/main/files/limit-ip"

# Lokasi file limit-ip di server
TARGET_PATH="/usr/bin/limit-ip"

# Fungsi untuk menampilkan progres
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

# Fungsi untuk memperbarui file limit-ip
update_limit_ip() {
    wget -q -O "$TARGET_PATH" "$REPO"
    if [[ $? -ne 0 ]]; then
        echo -e "\033[0;31mGagal mengunduh file limit-ip dari repositori.\033[0m"
        exit 1
    fi
    chmod +x "$TARGET_PATH"
    echo -e "\033[0;32mFile limit-ip berhasil diperbarui.\033[0m"
}

# Menjalankan pembaruan
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  MEMPERBARUI FILE LIMIT-IP"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
fun_bar 'update_limit_ip'
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to kembali ke menu"
menu
