#!/bin/bash

ngrokd -tlsKey=./server.key -tlsCrt=./server.crt -domain="${DOMAIN}" -httpAddr=":80" -httpsAddr=":443"
