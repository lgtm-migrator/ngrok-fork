#!/bin/bash

make release-assets

APPNAME="ngrok"

export GOOS=linux GOARCH=amd64
go build -o "bin/${APPNAME}-${GOOS}-${GOARCH}" -mod=vendor -tags "release" ngrok/main/ngrok
export GOOS=darwin GOARCH=amd64
go build -o "bin/${APPNAME}-${GOOS}-${GOARCH}" -mod=vendor -tags "release" ngrok/main/ngrok
export GOOS=windows GOARCH=amd64
go build -o "bin/${APPNAME}-${GOOS}-${GOARCH}.exe" -mod=vendor -tags "release" ngrok/main/ngrok
export GOOS="" GOARCH=""
go build -o "bin/${APPNAME}" -mod=vendor -tags "release" ngrok/main/ngrok
