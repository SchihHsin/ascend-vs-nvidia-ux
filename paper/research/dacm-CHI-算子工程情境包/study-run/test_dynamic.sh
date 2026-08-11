#!/usr/bin/env bash
source "$(dirname "$0")/common.sh"
need_stage M
headline 'dynamic-shape test'
cat <<'OUT'
[test] shape=[N], dtype=float16, format=ND
[error] tiling metadata missing for dynamic input
[context] totalLength, blockDim, tileLength and tailLength were not attached
          to the launch configuration.
OUT
