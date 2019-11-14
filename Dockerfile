# build image
FROM golang:1.13-alpine AS build-env

# install build tools
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh make

# build
WORKDIR /app
# copy sources
COPY . .
# make assets to go
RUN make release-assets 
# vendor build only can be executed outside the GOPATH
RUN go build --mod=vendor --tags="release" ngrok/main/ngrokd

# distribution image
FROM alpine

WORKDIR /app

# add CAs
RUN apk --no-cache add ca-certificates

COPY --from=build-env /app/ngrokd .

ADD start.sh .
ADD ./openssl/server.crt .
ADD ./openssl/server.key .

# start
CMD ["./start.sh"]