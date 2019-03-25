mkdir certs
rm -rf bin
mkdir bin
touch bin/index.txt
echo '01' > bin/serial.txt

echo "Creating a new CA..."
openssl req -x509 -config ca.cnf -newkey rsa:4096 -sha256 -nodes -out certs/ca-crt.pem -outform PEM

while true; do
  read -p "Trust CA certificate? [y/n] " yn
    case $yn in
        [Yy]* ) sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain certs/ca-crt.pem; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Generating certificate for Server 1..."
openssl req -config server-1.cnf -newkey rsa:2048 -sha256 -nodes -out certs/server-1-csr.pem -outform PEM
openssl ca -config ca.cnf -policy signing_policy -extensions signing_req -out certs/server-1-crt.pem -infiles certs/server-1-csr.pem

echo "Verifying cert..."
openssl verify -CAfile certs/ca-crt.pem certs/server-1-crt.pem
