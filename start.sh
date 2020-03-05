#!/bin/sh
# the entrypoint for docker image

if [ ! -f "./server.crt" ]; then
    echo "cert not exist, create server cert first"
    bash generate_key_for_host.sh ${DOMAIN}
fi

./ngrokd -tlsKey=./server.key -tlsCrt=./server.crt -domain="${DOMAIN}" -httpAddr=":80" -httpsAddr=":443"
