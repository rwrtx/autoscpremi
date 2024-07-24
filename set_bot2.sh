#!/bin/bash

# Nama file yang akan menyimpan chat_id dan token bot kedua
BOT2_FILE="/etc/bot/.bot2.db"

# Fungsi untuk mengatur chat_id dan token
function set_bot2_credentials() {
    read -p "Masukkan chat_id bot kedua: " bot2_chat_id
    read -p "Masukkan token bot kedua: " bot2_token

    echo "#bot2# $bot2_token $bot2_chat_id" > "$BOT2_FILE"
    echo "Bot kedua berhasil diatur."
}

# Membuat direktori jika belum ada
mkdir -p /etc/bot

# Menjalankan fungsi untuk mengatur chat_id dan token bot kedua
set_bot2_credentials
