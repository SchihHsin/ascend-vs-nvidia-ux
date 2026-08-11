#!/usr/bin/env bash
source "$(dirname "$0")/common.sh"
need_stage O
headline 'version check'
cat <<'OUT'
PyTorch: 2.x (minor version not locked)
torch_npu: not locked
CANN: not locked
Conclusion: do not assume ABI compatibility without the target version matrix.
OUT
