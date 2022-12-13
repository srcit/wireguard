FROM alpine:3.16

RUN apk add --no-cache wireguard-tools tini sudo

RUN adduser -u 1000 -D wire

RUN set -ex; \
    echo "wire ALL=(ALL) NOPASSWD: /usr/bin/wg, /usr/bin/wg-quick" > /etc/sudoers.d/wire

# The net.ipv4.conf.all.src_valid_mark sysctl is set when running the Docker container, so don't have WireGuard also set it
RUN sed -i "s:sysctl -q net.ipv4.conf.all.src_valid_mark=1:echo Skipping setting net.ipv4.conf.all.src_valid_mark:" /usr/bin/wg-quick

USER wire

ENTRYPOINT ["/sbin/tini", "--"]