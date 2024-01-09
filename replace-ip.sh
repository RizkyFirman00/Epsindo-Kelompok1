#!/bin/bash

# Mendapatkan alamat IP dari antarmuka default
ip_address=$(ip route get 1 | awk '{print $7;exit}')

# Menampilkan alamat IP ke pengguna
echo "Alamat IP antarmuka default: $ip_address"

# Meminta pengguna memasukkan IP Address
read -p "Masukkan IP Address yang ingin digunakan: " user_ip

# Menetapkan alamat IP ke dalam variabel
sed -i "s/\[IP_ADDRESS\]/$user_ip/g" docker-compose.yml

echo "Konfigurasi IP Address selesai."

docker compose up -d
