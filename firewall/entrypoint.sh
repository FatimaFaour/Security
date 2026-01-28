#!/bin/sh
set -eu

sysctl -w net.ipv4.ip_forward=1 >/dev/null

iptables-restore < /etc/iptables/rules.v4

touch /var/log/firewall/firewall.log

rsyslogd

exec tail -F /var/log/firewall/firewall.log
