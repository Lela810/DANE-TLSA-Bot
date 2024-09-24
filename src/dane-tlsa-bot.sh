#!/bin/bash
cd /app
echo "Running DANE-TLSA update"
rm dnsconfig.js sha256sum.txt certificate.pem certificate.der
echo "Downloading certificate"
openssl s_client -connect MAILSUBDOMAIN.ROOTDOMAIN:25 -starttls smtp -prexit </dev/null 2>/dev/null|openssl x509 -outform PEM >certificate.pem

openssl x509 -in certificate.pem -pubkey -noout | openssl ec -pubin -outform der -out certificate.der
echo "Generating SHA256 hash"
sh -c 'sha256sum < "certificate.der" | cut -d" " -f1' -- "$file" > sha256sum.txt
shaSum=`cat sha256sum.txt`
echo "Adjusting DNS configuration"
cp /app/dnsconfig.js.original dnsconfig.js
sed -i "s/HASH/$shaSum/g" dnsconfig.js
echo "DNS update in progress"
dnscontrol ppreview

echo "DNS update complete"

echo "DANE-TLSA update complete"