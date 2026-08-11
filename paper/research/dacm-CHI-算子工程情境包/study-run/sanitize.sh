#!/usr/bin/env bash
source "$(dirname "$0")/common.sh"
need_stage X
headline 'memory check'
if [[ "${1:-}" == "--with-launch-context" ]]; then
  if [[ ! -f "$ROOT/.launch-context" ]]; then
    echo '[error] launch context unavailable; inspect it before re-running.'; exit 1
  fi
  cat <<'OUT'
[msSanitizer] re-run prepared with launch context
[checkpoint] Verify tail handling against TilingData before claiming the
             global-memory access is fixed.
OUT
  set_stage O
else
  cat <<'OUT'
[msSanitizer] invalid global-memory access near AddCustom kernel launch
[context missing] input length and block configuration are absent from this
                  excerpt; this log alone cannot identify a root cause.
OUT
fi
