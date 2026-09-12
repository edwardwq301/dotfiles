#!/usr/bin/env bash
set -euo pipefail

NVIM_ARCH="x86_64"
NVIM_TARBALL="nvim-linux-${NVIM_ARCH}.tar.gz"
NVIM_URL="https://github.com/neovim/neovim/releases/latest/download/${NVIM_TARBALL}"
NVIM_DIR="/opt/nvim-linux-${NVIM_ARCH}"

if [ -x "${NVIM_DIR}/bin/nvim" ]; then
    echo "neovim already installed at ${NVIM_DIR}, skipping"
    exit 0
fi

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

curl -fL -o "${TMP_DIR}/${NVIM_TARBALL}" "${NVIM_URL}"

sudo rm -rf "${NVIM_DIR}"
sudo tar -C /opt -xzf "${TMP_DIR}/${NVIM_TARBALL}"
