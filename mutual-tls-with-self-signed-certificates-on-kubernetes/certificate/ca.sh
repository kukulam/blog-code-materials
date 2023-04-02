# Generate the RSA private key
openssl genpkey -outform PEM -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out tls.key

# Create the CSR (Click csrconfig.txt in the command below to download config)
openssl req -new -nodes -key tls.key -config csrconfig.txt -nameopt utf8 -utf8 -out cert.csr

# Self-sign your CSR (Click certconfig.txt in the command below to download config)
openssl req -x509 -nodes -in cert.csr -days 365 -key tls.key -config certconfig.txt -extensions req_ext -nameopt utf8 -utf8 -out tls.crt

# Clean up
rm cert.csr