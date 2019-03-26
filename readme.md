<h1 align="center">Certificate Authority Generator for OS X</h1>
<h3 align="center">🔒        💻</h3> 
<p align="center">
  <i>One certificate to sign them all</i>  
  <strong>Creates a trusted certificate authority on your Mac for dev mode</strong><br /><br />

</p>

## Overview

This script creates a trusted CA on your Mac and signs new trusted certificates with it. These are modern certificates that will pass modern browsers' heightened requirements. This is similar in function to [mkcert](https://github.com/FiloSottile/mkcert) but more easily configured using [OpenSSL .cnf files](https://github.com/openssl/openssl/blob/master/apps/openssl.cnf).

### Usage
Run `bash gen-certs.sh` and you'll be walked through the rest. Mac will ask for your password to add the CA to your keychain.

To use the website, run `sudo nano /etc/hosts` and add the following lines:

```
127.0.0.1       server-1.com
127.0.0.1       api.server-1.com
```

### Sign more certificates
You can sign as many server certificates as you want with this new CA on your device. Just duplicate the `server-1.cnf` and duplicate the last two lines of `gen-certs.sh`.

### Tips
If you're developing with Node, make sure to `export NODE_EXTRA_CA_CERTS=$(pwd)/certs/ca-crt.pem` to trust your CA.
