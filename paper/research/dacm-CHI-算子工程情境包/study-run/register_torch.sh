#!/usr/bin/env bash
source "$(dirname "$0")/common.sh"
need_stage O
headline 'registration route'
cat <<'OUT'
[recorded] framework registration route prepared
[checkpoint] In the target environment, verify dispatcher symbol, build
             artifact and the exact PyTorch / torch_npu / CANN matrix.
OUT
set_stage L
