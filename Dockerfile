# build image
FROM golang:1.13-alpine3.9 AS build-env

# install build tools
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

# build
WORKDIR /app
# copy sources
COPY . .
# vendor build only can be executed outside the GOPATH
RUN go build --mod=vendor --tags="release" ngrok/main/ngrokd

# distribution image
FROM alpine:3.9

# add CAs
RUN apk --no-cache add ca-certificates

COPY --from=build-env /app/ngrokd .

COPY start.sh
COPY ./openssl/server.crt
COPY ./openssl/server.key

# start
CMD ["./cli"]