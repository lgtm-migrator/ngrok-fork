# build image
FROM golang:1.13-alpine AS build-env

# install build tools
RUN apk update && apk add make

# build
WORKDIR /app
# copy sources
COPY . .
# make assets to go
RUN make release-assets 
# vendor build only can be executed outside the GOPATH
RUN go build --mod=vendor --tags="release" ngrok/main/ngrok

FROM alpine

WORKDIR /app
COPY --from=build-env /app/ngrok .
ADD client_start.sh .

# start
CMD ["./client_start.sh"]