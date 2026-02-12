#!/bin/bash
set -euo pipefail

DISK_THRESHOLD=${DISK_THRESHOLD:-80}
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Disk usage: ${USAGE}% (threshold=${DISK_THRESHOLD}%)"

if [ "$USAGE" -gt "$DISK_THRESHOLD" ]; then
  echo "FAIL: Disk usage above threshold"
  exit 1
fi

echo "OK: Disk usage within threshold"
