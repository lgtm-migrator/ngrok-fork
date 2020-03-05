# ngrok fork project

[![CircleCI](https://circleci.com/gh/Soontao/ngrok-fork.svg?style=shield)](https://circleci.com/gh/Soontao/ngrok-fork)
![Snapshot Build](https://github.com/Soontao/ngrok-fork/workflows/Snapshot%20Build/badge.svg)

This is a fork for ngrok

## usage

expose with docker container

```bash
docker run --name ngrok -d --restart=always -p 4080:80 -p 4444:443 -p 4443:4443 -e DOMAIN=YOUR.HOST.DOMAIN.com theosun/ngrok-fork
```