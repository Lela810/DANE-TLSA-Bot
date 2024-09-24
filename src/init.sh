#!/bin/bash
cd /app
echo "Starting DANE-TLSA Bot"
sed -i "s/apiTokenReplace/$CFTOKEN/g" creds.json
sed -i "s/accountIDReplace/$CFUID/g" creds.json
sed -i "s/ROOTDOMAIN/$DOMAIN/g" dnsconfig.js.original
sed -i "s/ROOTDOMAIN/$DOMAIN/g" dane-tlsa-bot.sh
sed -i "s/MAILSUBDOMAIN/$MAILSUBDOMAIN/g" dane-tlsa-bot.sh
sed -i "s/MAILSUBDOMAIN/$MAILSUBDOMAIN/g" dnsconfig.js.original

crontab -l > mycron
echo "*/1 * * * * bash /app/dane-tlsa-bot.sh" >> mycron
crontab mycron
rm mycron

echo "Initial setup complete"
bash /app/dane-tlsa-bot.sh