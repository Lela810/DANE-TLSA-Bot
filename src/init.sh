#!/bin/bash
sed -i "s/apiTokenReplace/$CFTOKEN/g" creds.json
sed -i "s/accountIDReplace/$CFUID/g" creds.json
sed -i "s/DOMAIN/$DOMAIN/g" dnsconfig.js
sed -i "s/MAILSERVER/$MAILSERVER/g" dane-tlsa-bot.sh