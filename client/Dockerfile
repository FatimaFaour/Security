FROM alpine:3.20

RUN apk add --no-cache curl

COPY traffic.sh /usr/local/bin/traffic.sh
RUN chmod +x /usr/local/bin/traffic.sh \
    && mkdir -p /var/log/client

CMD ["/usr/local/bin/traffic.sh"]
