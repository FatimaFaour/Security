FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends snort ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/snort /etc/snort/rules

CMD ["snort", "-i", "eth0", "-c", "/etc/snort/snort.conf", "-A", "fast", "-l", "/var/log/snort"]
