# <img src="https://res.cloudinary.com/digf90pwi/image/upload/v1583393648/tunnel_ayuioe.png" height="25px"/> ngrok project

[![CircleCI](https://circleci.com/gh/Soontao/ngrok-fork.svg?style=shield)](https://circleci.com/gh/Soontao/ngrok-fork)
![Snapshot Build](https://github.com/Soontao/ngrok-fork/workflows/Snapshot%20Build/badge.svg)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/theosun/ngrok-fork)

This is a fork project for ngrok, make its easier to use.

## security alert

**PLEASE READ THIS PARAGRAPH FIRSTLY, VERY IMPORTANT !!!**

To simplify the client build/usage, the **tls verify** logic will be skipped, so your traffic is **in-secure**, please DO NOT use this service to transfer sensitive/production data.

The server will generate a **self-signed** ssl cert as its tls encryption cert, and client will connect to server without ssl chain verify, so user doesn't need to build the client/server again & again.

## client setup

download binary from [snapshot build](https://github.com/Soontao/ngrok-fork/actions?query=workflow%3A%22Snapshot+Build%22)

then start your tunnel with command

```bash
ngrok --serveraddr self_host_domain.com:4443 81
```

* the **serveraddr** is mandatory for your own server
  * format: server_domain:transfer_port, default, the transfer port should be `4443` 
* the second parameter `81` is your local service port

## server setup

run following command in your server

```bash
docker run --name ngrokd -d --restart=always -p 4080:80 -p 4443:4443 -e DOMAIN=self_host_domain.com theosun/ngrok-fork
```

* you must create domain & sub-domain DNS records for your server firstly
  * self_host_domain.com    -> your server ip
  * *.self_host_domain.com  -> your server ip
* **the DOMAIN environment variable is mandatory**
  * DOMAIN env should be the root domain of your server, like `self_host_domain.com`
* port 4080, the http service port
* port 4443, the ngrok transfer port, the client users need to get this port to setup their tunnels
* setup reverse proxy for the ngrok http service port

## get a wildcard cert for your domain

(first of first, you should have your own domain)

just ref [this doc](https://github.com/Soontao/ngrok-fork/wiki/Create-Let's-Encrypt-wildcard-cert) 

## server example reverse proxy config (for caddy server v1)

```conf
*.your_host_domain:443 {
  gzip
  proxy / http://127.0.0.1:4080 {
    transparent
    websocket
  }
  tls wildcardcertpath wildcardcertkeypath
}
```

for other server like `nginx`, you can find many many docs from search engine.



## Icon

<div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>

## [LICENSE](./LICENSE)