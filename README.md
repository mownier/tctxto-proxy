# tctxto Proxy

A proxy server that will be used for tctxto Client


```
$ make clone

# BA = backend address, default is 0.0.0.0:3232
# DP = server http debug port, default is 2121
# Default
$ make build
# Custom
$ make build BA=0.0.0.0:6789 DP=9876
```