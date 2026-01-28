FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends iptables iproute2 rsyslog procps \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
COPY rules.v4 /etc/iptables/rules.v4
COPY rsyslog-firewall.conf /etc/rsyslog.d/10-firewall.conf

RUN chmod +x /entrypoint.sh \
    && mkdir -p /var/log/firewall

ENTRYPOINT ["/entrypoint.sh"]
