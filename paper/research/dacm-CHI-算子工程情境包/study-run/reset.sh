#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
rm -f "$ROOT/.study-state" "$ROOT/.launch-context"
echo '[study-run] reset to D · kernel stage'
