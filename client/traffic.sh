#!/bin/sh
set -eu

TARGET_URL="http://10.10.20.10/"
LOG_FILE="/var/log/client/traffic.log"

while true; do
  echo "[$(date -Iseconds)] Requesting ${TARGET_URL}" | tee -a "$LOG_FILE"
  curl -s -o /dev/null -w "HTTP %{http_code}\n" "$TARGET_URL" | tee -a "$LOG_FILE"
  sleep 5
done
