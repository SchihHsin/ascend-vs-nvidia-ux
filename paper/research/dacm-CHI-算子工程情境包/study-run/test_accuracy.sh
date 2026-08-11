#!/usr/bin/env bash
source "$(dirname "$0")/common.sh"
need_stage L
headline 'accuracy check'
cat <<'OUT'
[input] shape=[65537]
[reference] unavailable in this workspace
[risk] tail handling and dtype conversion may affect boundary values
[acceptance threshold] not supplied by project owner

[question] What evidence and business threshold are required before delivery?
OUT
