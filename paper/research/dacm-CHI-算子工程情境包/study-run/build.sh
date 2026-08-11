#!/usr/bin/env bash
source "$(dirname "$0")/common.sh"
need_stage D
headline 'build'
if [[ "${STUDY_SOC_VERSION:-}" != "Ascend910B1" ]]; then
  cat <<'OUT'
[configure] AddCustom custom operator
[error] target ai_core_<soc_version> is unresolved
[hint] The project has no target device fact. Inspect the local environment
       snapshot or determine what device/SoC information is required before
       choosing an engineering route.
OUT
  exit 1
fi
cat <<'OUT'
[configure] target: ai_core_Ascend910B1
[generate] project configuration accepted
[note] kernel source remains a starting point. In a real environment, the
       implementation, launch configuration and numerical validation still
       require verification.
OUT
set_stage M
