#!/bin/bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# System Request : Debian 9+/Ubuntu 18.04+/20+
# Develovers » R32WRT_STORE
# telegram   » https://t.me/R32WRT_STORE
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# R32WRTx TUNNELING
#random
apt install jq curl -y
rm -rf /root/xray/scdomain
mkdir -p /root/xray
clear
#sub=$(</dev/urandom tr -dc a-z0-9 | head -c5)
read -rp "Input domain pointing wilcard Contoh *.awaldomainvps  :
" -e subsl
#subsl=$(</dev/urandom tr -dc a-z0-9 | head -c5)
DOMAIN=r32wrtxtunneling.site
CNAME_DOMAIN=${subsl}.r32wrtxtunneling.site
CF_ID=amandafitrizharifa009@gmail.com
CF_KEY=3c45413104a3c39f1db9dff20acb3a99d7610
set -euo pipefail
IP=$(curl -sS ifconfig.me);
echo "Updating WILDCARD for ${CNAME_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${CNAME_DOMAIN}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
if [[ "${#RECORD}" -le 10 ]]; then
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"CNAME","name":"'${CNAME_DOMAIN}'","content":"'${DOMAIN}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"CNAME","name":"'${CNAME_DOMAIN}'","content":"'${DOMAIN}'","ttl":120,"proxied":false}')
echo $CNAME_DOMAIN >/etc/xray/cname
rm -f /root/cfcnamedomain.sh
