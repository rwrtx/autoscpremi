#!/bin/bash
DOMAIN="r32wrtxtunneling.site"
DAOMIN=$(cat /etc/xray/domain)
SUB=$(tr </dev/urandom -dc a-z0-9 | head -c4)
SUB_DOMAIN=${SUB}."r32wrtxtunneling.site"
NS_DOMAIN=ns.${SUB_DOMAIN}
CF_ID=amandafitrizharifa009@gmail.com
CF_KEY=3c45413104a3c39f1db9dff20acb3a99d7610
set -euo pipefail
IP=$(wget -qO- ipinfo.io/ip)
echo "Updating DNS NS for ${NS_DOMAIN}..."
ZONE=$(
	curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
	-H "X-Auth-Email: ${CF_ID}" \
	-H "X-Auth-Key: ${CF_KEY}" \
	-H "Content-Type: application/json" | jq -r .result[0].id
)

RECORD=$(
	curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${NS_DOMAIN}" \
	-H "X-Auth-Email: ${CF_ID}" \
	-H "X-Auth-Key: ${CF_KEY}" \
	-H "Content-Type: application/json" | jq -r .result[0].id
)

if [[ "${#RECORD}" -le 10 ]]; then
	RECORD=$(
		curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
		-H "X-Auth-Email: ${CF_ID}" \
		-H "X-Auth-Key: ${CF_KEY}" \
		-H "Content-Type: application/json" \
		--data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DAOMIN}'","proxied":false}' | jq -r .result.id
	)
fi

RESULT=$(
	curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
	-H "X-Auth-Email: ${CF_ID}" \
	-H "X-Auth-Key: ${CF_KEY}" \
	-H "Content-Type: application/json" \
	--data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DAOMIN}'","proxied":false}'
)
echo $NS_DOMAIN >/etc/xray/dns
rm -f /root/cfnsdomain.sh
