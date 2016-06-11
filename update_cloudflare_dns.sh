#!/bin/sh

API_KEY=
EMAIL=
HOST_NAME=
ZONE_ID=
DNS_RECORD_ID=

ip=`curl http://icanhazip.com`
old_ip=`cat old_ip.txt`

if [ "$ip" = "$old_ip" ]
then
  echo "Public IP has not changed"
else
  echo $ip > old_ip.txt
  curl -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$DNS_RECORD_ID" \
    -H "X-Auth-Email: $EMAIL" \
    -H "X-Auth-Key: $API_KEY" \
    -H "Content-Type: application/json" \
    --data '{"id":"'$DNS_RECORD_ID'","type":"A","name":"'$HOST_NAME'","content":"'$ip'"}'
fi
