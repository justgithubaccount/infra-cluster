#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
module_file="${repo_root}/modules/timeweb-k8s/main.tf"

grep -Eq 'source[[:space:]]*=[[:space:]]*"timeweb-cloud/timeweb-cloud"' "${module_file}"
grep -Eq 'version[[:space:]]*=[[:space:]]*"~> 1\.8"' "${module_file}"

if grep -R -q --include='*.tf' 'tf\.timeweb\.cloud/timeweb-cloud/timeweb-cloud' "${repo_root}"; then
  echo "legacy Timeweb provider source is still present" >&2
  exit 1
fi

grep -A5 'variable "project_id"' "${repo_root}/modules/timeweb-k8s/variables.tf" | grep -Eq 'default[[:space:]]*=[[:space:]]*null'
grep -A5 'variable "network_id"' "${repo_root}/modules/timeweb-k8s/variables.tf" | grep -Eq 'default[[:space:]]*=[[:space:]]*null'
