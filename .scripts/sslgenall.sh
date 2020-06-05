##################################################
# For demonstration purposes only, generate 
# all ca/client/server keys
##################################################

# ca
openssl req \
-newkey rsa:2048 -nodes -keyout ca.key \
-out ca.csr

openssl req -subj '/C=HU/ST=Budapest/L=Budapest/O=nxsec/OU=log4ensics/CN=nxlog-test-ca' \
-x509 -new -nodes -key ca.key -sha256 -days 9125 -out ca.pem

# server
openssl req \
-newkey rsa:2048 -nodes -keyout server-key.pem \
-out server.csr

openssl req -subj '/C=HU/ST=Budapest/L=Budapest/O=nxsec/OU=log4ensics/CN=server-cert' \
-new -key server-key.pem -out server.csr

openssl x509 -req -in server.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out server-cert.pem -days 3650 -sha256

#client
openssl req \
-newkey rsa:2048 -nodes -keyout client-key.pem \
-out client.csr

openssl req -subj '/C=HU/ST=Budapest/L=Budapest/O=nxsec/OU=log4ensics/CN=client-cert' \
-new -key client-key.pem -out client.csr

openssl x509 -req -in client.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out client-cert.pem -days 3650 -sha256
