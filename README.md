# ngrok

This is a fork for ngrok

## usage

expose with docker container

```bash
docker build . -t theosun/ngrokd
docker run -d --restart=always -p 4080:80 -p 4444:443 -p 4443:4443 theosun/ngrokd
```