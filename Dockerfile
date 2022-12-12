FROM alpine:3.16

RUN apk add --no-cache wireguard-tools tini sudo

ENTRYPOINT ["/sbin/tini", "--"]