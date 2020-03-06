#!/bin/sh
# the entrypoint for docker image

./ngrok --serveraddr $SERVER_ADDR $LOCAL_SERVICE

