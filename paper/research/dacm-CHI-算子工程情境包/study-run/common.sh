#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
STATE_FILE="$ROOT/.study-state"

stage() { [[ -f "$STATE_FILE" ]] && cat "$STATE_FILE" || echo "D"; }
set_stage() { printf '%s\n' "$1" > "$STATE_FILE"; }
need_stage() {
  if [[ "$(stage)" != "$1" ]]; then
    printf '[study-run] 当前状态为 %s；此命令应在 %s 节点运行。\n' "$(stage)" "$1" >&2
    exit 2
  fi
}
headline() { printf '\n== AddCustom study-run · %s ==\n' "$1"; }
