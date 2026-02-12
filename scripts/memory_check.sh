#!/bin/bash
set -euo pipefail

THRESHOLD=${THRESHOLD:-80}
USED=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')

echo "Memory usage: ${USED}% (threshold=${THRESHOLD}%)"

if [ "$USED" -gt "$THRESHOLD" ]; then
  echo "FAIL: Memory usage above threshold"
  exit 1
fi

echo "OK: Memory usage within threshold"
