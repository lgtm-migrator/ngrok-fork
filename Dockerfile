FROM ubuntu:14.04

ENV NGROK /opt/ngrok
ENV DOMAIN ngrok.vps3.fornever.org

EXPOSE 80 443 4443

COPY start.sh $NGROK/
COPY ./ngrok-linux-amd64 $NGROK/ngrokd
COPY ./openssl/server.crt $NGROK/server.crt
COPY ./openssl/server.key $NGROK/server.key

RUN chmod +x $NGROK/ngrokd
RUN chmod +x $NGROK/start.sh

CMD $NGROK/start.sh