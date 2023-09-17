#generate the RSA private key
openssl genpkey -outform PEM -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out priv.key

#Create the CSR (Click csrconfig.txt in the command below to download config)
openssl req -new -nodes -key priv.key -config csrconfig.txt -nameopt utf8 -utf8 -out cert.csr

#Self-sign your CSR (Click certconfig.txt in the command below to download config)
openssl req -x509 -nodes -in cert.csr -days 365 -key priv.key -config certconfig.txt -extensions req_ext -nameopt utf8 -utf8 -out cert.crt