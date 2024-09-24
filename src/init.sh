#!/bin/bash -l
cd /app
echo "Starting DANE-TLSA Bot"
sed -i "s/apiTokenReplace/$CFTOKEN/g" creds.json
sed -i "s/accountIDReplace/$CFUID/g" creds.json
sed -i "s/ROOTDOMAIN/$DOMAIN/g" dnsconfig.js.original
sed -i "s/ROOTDOMAIN/$DOMAIN/g" dane-tlsa-bot.sh
sed -i "s/MAILSUBDOMAIN/$MAILSUBDOMAIN/g" dane-tlsa-bot.sh
sed -i "s/MAILSUBDOMAIN/$MAILSUBDOMAIN/g" dnsconfig.js.original

if [[ $WORKINGMODE = "prod" ]]; then
    touch .prod
fi

sudo touch /var/log/cron.log

echo "Initial setup complete"
sudo sudo cron && sudo tail -f /var/log/cron.log
#bash /app/dane-tlsa-bot.sh