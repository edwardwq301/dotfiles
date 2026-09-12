#!/usr/bin/env bash
set -euo pipefail

# 非官方 apt 源、需手动执行的安装（不走 ./install）
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash "${BASEDIR}/install-tpm.sh"
bash "${BASEDIR}/install-neovim.sh"
bash "${BASEDIR}/install-docker.sh"
bash "${BASEDIR}/install-chsrc.sh"
