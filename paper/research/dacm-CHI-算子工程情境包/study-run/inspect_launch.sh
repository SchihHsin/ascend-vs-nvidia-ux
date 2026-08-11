#!/usr/bin/env bash
source "$(dirname "$0")/common.sh"
need_stage X
headline 'launch context'
cat <<'OUT'
shape=[65537]
blockDim=32
final tile tail=1
dtype=float16, format=ND
OUT
touch "$ROOT/.launch-context"
