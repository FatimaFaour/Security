#!/bin/sh
set -eu

if ! sysctl -w net.ipv4.ip_forward=1 >/dev/null 2>&1; then
  echo "warning: unable to set net.ipv4.ip_forward (insufficient privileges)" >&2
fi

if ! iptables-restore < /etc/iptables/rules.v4; then
  if command -v iptables-restore-legacy >/dev/null 2>&1; then
    echo "warning: iptables-restore failed; retrying with iptables-restore-legacy" >&2
    iptables-restore-legacy < /etc/iptables/rules.v4 || \
      echo "warning: iptables-restore-legacy failed; firewall rules not applied" >&2
  else
    echo "warning: iptables-restore failed and iptables-restore-legacy not found" >&2
  fi
fi


touch /var/log/firewall/firewall.log

rsyslogd

exec tail -F /var/log/firewall/firewall.log
