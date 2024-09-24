#!/bin/bash
echo "Starting DANE-TLSA Bot"
sed -i "s/apiTokenReplace/$CFTOKEN/g" creds.json
sed -i "s/accountIDReplace/$CFUID/g" creds.json
sed -i "s/DOMAIN/$DOMAIN/g" dnsconfig.js.original
sed -i "s/DOMAIN/$DOMAIN/g" dane-tlsa-bot.sh
sed -i "s/MAILSUBDOMAIN/$MAILSUBDOMAIN/g" dane-tlsa-bot.sh
sed -i "s/MAILSUBDOMAIN/$MAILSUBDOMAIN/g" dnsconfig.js.original