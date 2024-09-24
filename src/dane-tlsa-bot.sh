#!/bin/bash
openssl x509 -in <(openssl s_client -connect mail.lklaus.ch:25 -starttls smtp -prexit 2>/dev/null) -out certificate.pem -outform pem
openssl x509 -in certificate.pem -pubkey -noout | openssl ec -pubin -outform der -out certificate.der
sh -c 'sha256sum < "certificate.der" | cut -d" " -f1' -- "$file" > sha256sum.txt
shaSum=`cat sha256sum.txt`
sed -i "s/HASH/$shaSum/g" dnsconfig.js