#!/usr/bin/env bash
set -euo pipefail

TPM_DIR="${HOME}/.tmux/plugins/tpm"
TPM_REPO="https://github.com/tmux-plugins/tpm"

if [ -d "${TPM_DIR}/.git" ]; then
    git -C "${TPM_DIR}" pull --ff-only
else
    mkdir -p "$(dirname "${TPM_DIR}")"
    git clone --depth 1 "${TPM_REPO}" "${TPM_DIR}"
fi
