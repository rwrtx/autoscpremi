#!/bin/bash
MYIP=$(wget -qO- icanhazip.com);
apt install jq curl -y
rm -rf /root/xray/scdomain
mkdir -p /root/xray
clear
echo ""
echo ""
echo ""
read -p "Masukan Domain (contoh : ngentod-gaya69)" domen
DOMAIN=r32wrtxtunneling.site
DAOMIN=$(cat /etc/xray/domain
#sub=$(</dev/urandom tr -dc a-z0-9 | head -c5)
dns=${sub}.r32wrtxtunneling.site
NS_DOMAIN=ns.${dns}
CF_ID=amandafitrizharifa009@gmail.com
CF_KEY=3c45413104a3c39f1db9dff20acb3a99d7610
set -euo pipefail
IP=$(wget -qO- icanhazip.com);
echo "Updating DNS for ${dns}..."
echo "Updating DNS NS for ${NS_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${dns}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${dns}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
     --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DAOMIN}'","proxied":false}' | jq -r .result.id
	)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${dns}'","content":"'${IP}'","ttl":120,"proxied":false}')
     --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DAOMIN}'","proxied":false}'
)
echo "$dns" > /root/domain
echo "$dns" > /root/scdomain
echo "$dns" > /etc/xray/domain
echo "$dns" > /etc/v2ray/domain
echo "$dns" > /etc/xray/scdomain
echo "IP=$dns" > /var/lib/kyt/ipvps.conf
echo "$NS_DOMAIN" >/etc/xray/dns
echo "Subdomain kamu adalah : $dns
echo "NS domain kamu adalah : $NS_DOMAIN
sleep 2
rm -f /root/cf.sh
