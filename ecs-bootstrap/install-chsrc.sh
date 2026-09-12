#!/usr/bin/env bash
set -euo pipefail

if command -v chsrc >/dev/null 2>&1; then
    echo "chsrc already installed, skipping"
    exit 0
fi

CHSRC_DEB="chsrc_latest-1_amd64.deb"
CHSRC_URL="https://gitee.com/RubyMetric/chsrc/releases/download/pre/${CHSRC_DEB}"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

wget -O "${TMP_DIR}/${CHSRC_DEB}" "${CHSRC_URL}"

sudo apt-get install -y "${TMP_DIR}/${CHSRC_DEB}"
