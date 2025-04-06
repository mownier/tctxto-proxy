# tctxto Proxy

A proxy server that will be used for tctxto Client

```
# Shows how to configure the proxy
$ make help

# Runs the server with custom variable values
$ make run BA=0.0.0.0:9090 DP=7878 AO=http://localhost:2323

# Runs the server with default variable values
$ make run AO=http://localhost:2323
```

## How to generate pems for tls

```
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -subj "/CN=localhost"

openssl rsa -in key.pem -out decrypted_key.pem
``