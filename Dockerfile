FROM alpine:3.16

RUN apk add --no-cache wireguard-tools tini sudo

RUN adduser -u 1000 -D wire

RUN set -ex; \
    echo "wire ALL=(ALL) NOPASSWD: /usr/bin/wg, /usr/bin/wg-quick, /sbin/iptables, /sbin/ip6tables" > /etc/sudoers.d/wire

USER wire

ENTRYPOINT ["/sbin/tini", "--"]