# <img src="https://res.cloudinary.com/digf90pwi/image/upload/v1583393648/tunnel_ayuioe.png" height="25px"/> ngrok project

[![CircleCI](https://circleci.com/gh/Soontao/ngrok-fork.svg?style=shield)](https://circleci.com/gh/Soontao/ngrok-fork)
![Snapshot Build](https://github.com/Soontao/ngrok-fork/workflows/Snapshot%20Build/badge.svg)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/theosun/ngrok-fork)

This is a fork project for ngrok, make its easier to use.

## security alert

**PLEASE READ THIS PARAGRAPH FIRSTLY, VERY IMPORTANT !!!**

For simplify the client build/usage, the **tls verify** logic will be skipped, so your traffic is **in-secure**, please DO NOT use this service to transfer sensitive/production data.

## client setup

download binary from [snapshot build](https://github.com/Soontao/ngrok-fork/actions?query=workflow%3A%22Snapshot+Build%22)

then start your tunnel with command

```bash
ngrok --serveraddr your_host_domain.com:4443 81
```

* the **serveraddr** is mandatory for your own server
* the second parameter `81` is your local service port

## server setup

run following command in your server

```bash
docker run --name ngrokd -d --restart=always -p 4080:80 -p 4443:4443 -e DOMAIN=your_host_domain.com theosun/ngrok-fork
```

* **the DOMAIN environment variable is mandatory**
  * you must point the domain & sub domain to your server
    * your_host_domain.com -> your server ip
    * *.your_host_domain.com -> your server ip
* port 4080 http port
* port 4443 ngrok transfer port
* setup reverse proxy 


## server example reverse proxy config (for caddy server v1)

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

for other server like `nginx`, you can find many many docs from search engine.

## Icon

<div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>

## [LICENSE](./LICENSE)