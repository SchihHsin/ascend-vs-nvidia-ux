#!/usr/bin/env bash
source "$(dirname "$0")/common.sh"
need_stage O
headline 'PyTorch invocation'
cat <<'OUT'
Traceback (most recent call last):
  AttributeError: namespace 'addcustom' has no attribute 'add'

[hint] Registration/binding and version compatibility are not established.
OUT
