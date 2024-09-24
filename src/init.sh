#!/bin/bash
sed -i "s/apiTokenReplace/$CFTOKEN/g" creds.json
sed -i "s/accountIDReplace/$CFUID/g" creds.json
sed -i "s/accountIDReplace/$CFUID/g" creds.json