#!/bin/bash
set -euo pipefail

MEM_THRESHOLD=${MEM_THRESHOLD:-80}
USED=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')

echo "Memory usage: ${USED}% (threshold=${MEM_THRESHOLD}%)"

if [ "$USED" -gt "$MEM_THRESHOLD" ]; then
  echo "FAIL: Memory usage above threshold"
  exit 1
fi

echo "OK: Memory usage within threshold"
