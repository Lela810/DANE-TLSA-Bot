openssl x509 -in <(openssl s_client -connect localhost:25 -starttls smtp -prexit 2>/dev/null) -out certificate.pem -outform pem

openssl x509 -in certificate.pem -pubkey -noout | openssl ec -pubin -outform der -out certificate.der

sh -c 'sha256sum < "certificate.der" | cut -d" " -f1' -- "$file"