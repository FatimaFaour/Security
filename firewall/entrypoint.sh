#!/bin/sh
set -eu

if ! sysctl -w net.ipv4.ip_forward=1 >/dev/null 2>&1; then
  echo "warning: unable to set net.ipv4.ip_forward (insufficient privileges)" >&2
fi

iptables-restore < /etc/iptables/rules.v4

touch /var/log/firewall/firewall.log

rsyslogd

exec tail -F /var/log/firewall/firewall.log
