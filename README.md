# tctxto Proxy

A proxy server that will be used for tctxto Client


## Environment variables

```
export TCTXTO_PROXY_BA= # address of tctxto server, default: <LOCAL_IP>:3232
export TCTXTO_PROXY_DP= # debug port of tctxto proxy, default: 2121
export TCTXTO_PROXY_AO= # address of tctxto client, default: http://<LOCAL_IP>:2323
```

## How to retrieve submodules

```
# Initialize submodules
git submodule init
git submodule update --init --recursive

# Update submodules
git submodule update --remote
```