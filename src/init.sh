#!/bin/bash -l
cd /app
echo "Starting DANE-TLSA Bot"
sed -i "s/apiTokenReplace/$CFTOKEN/g" creds.json
sed -i "s/accountIDReplace/$CFUID/g" creds.json
sed -i "s/ROOTDOMAIN/$DOMAIN/g" dnsconfig.js.original
sed -i "s/ROOTDOMAIN/$DOMAIN/g" dane-tlsa-bot.sh
sed -i "s/MAILSUBDOMAIN/$MAILSUBDOMAIN/g" dane-tlsa-bot.sh
sed -i "s/MAILSUBDOMAIN/$MAILSUBDOMAIN/g" dnsconfig.js.original

echo "Initial setup complete"
sudo cron -f
#bash /app/dane-tlsa-bot.sh