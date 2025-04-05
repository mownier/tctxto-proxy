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