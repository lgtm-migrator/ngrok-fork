# ngrok project

[![CircleCI](https://circleci.com/gh/Soontao/ngrok-fork.svg?style=shield)](https://circleci.com/gh/Soontao/ngrok-fork)
![Snapshot Build](https://github.com/Soontao/ngrok-fork/workflows/Snapshot%20Build/badge.svg)

This is a fork for ngrok, make its easier to use.

## security alert

For simplify the client building, the **tls verify** logic will be skipped, please don't use this service to transfer sensitive/production data.

## client setup

download binary from [snapshot build](https://github.com/Soontao/ngrok-fork/actions?query=workflow%3A%22Snapshot+Build%22)

then start your tunnel with command

```bash
ngrok --serveraddr your_host_domain.com:4443 81
```

* the **serveraddr** is mandatory for your own server

## server setup

run following command in your server

```bash
docker run --name ngrok -d --restart=always -p 4080:80 -p 4443:4443 -e DOMAIN=your_host_domain.com theosun/ngrok-fork
```

* **the DOMAIN environment variable is mandatory**
  * you must point the domain & sub domain to your server
    * your_host_domain.com -> your server ip
    * *.your_host_domain.com -> your server ip
* port 4080 http port
* port 4443 ngrok transfer port
* setup reverse proxy 


## server example reverse proxy config (caddy server v1)

```conf
*.your_host_domain:443 {
        gzip
        proxy / http://127.0.0.1:4080 {
                transparent
                websocket
        }
    tls certpath certkeypath
}
```
