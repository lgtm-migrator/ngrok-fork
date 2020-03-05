#!/bin/bash

make assets

export GOOS=linux GOARCH=amd64
go build -o "bin/${PWD##*/}-${GOOS}-${GOARCH}" -tags "release" ngrok/main/ngrok
export GOOS=linux GOARCH=386 
go build -o "bin/${PWD##*/}-${GOOS}-${GOARCH}" -tags "release" ngrok/main/ngrok
export GOOS=linux GOARCH=arm64 
go build -o "bin/${PWD##*/}-${GOOS}-${GOARCH}" -tags "release" ngrok/main/ngrok
export GOOS=darwin GOARCH=amd64
go build -o "bin/${PWD##*/}-${GOOS}-${GOARCH}" -tags "release" ngrok/main/ngrok
export GOOS=windows GOARCH=amd64
go build -o "bin/${PWD##*/}-${GOOS}-${GOARCH}.exe" -tags "release" ngrok/main/ngrok
export GOOS="" GOARCH=""
go build -o "bin/${PWD##*/}" -tags "release" ngrok/main/ngrok
