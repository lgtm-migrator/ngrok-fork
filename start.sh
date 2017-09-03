#!/bin/bash

$NGROK/ngrokd -tlsKey=$NGROK/server.key -tlsCrt=$NGROK/server.crt -domain="ngrok.vps3.fornever.org" -httpAddr=":80" -httpsAddr=":443"
