#!/bin/bash
set -euo pipefail

THRESHOLD=${THRESHOLD:-80}
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Disk usage: ${USAGE}% (threshold=${THRESHOLD}%)"

if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "FAIL: Disk usage above threshold"
  exit 1
fi

echo "OK: Disk usage within threshold"
