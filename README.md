# CloudFlare dynamic DNS shell script
## API v4
A small shell script used to update your DNS record using Cloudflare API.

Fill in constants at top of file
```
# Get ZONE_ID
curl -s -X GET "https://api.cloudflare.com/client/v4/zones" \
-H "X-Auth-Email: $EMAIL" \
-H "X-Auth-Key: $API_KEY" \
-H "Content-Type: application/json"}'
```
```
# Get DNS_RECORD_ID
curl -s GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records" \
-H "X-Auth-Email: $cfuser" \
-H "X-Auth-Key: $cfkey" \
-H "Content-Type: application/json"}'
```

Add cron task to run every 10min or so.
