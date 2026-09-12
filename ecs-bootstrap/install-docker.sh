#!/usr/bin/env bash
set -euo pipefail

if command -v docker >/dev/null 2>&1; then
    echo "docker already installed, skipping"
    exit 0
fi

DOCKER_DISTRO="$(. /etc/os-release && echo "${ID}")"
DOCKER_MIRROR="https://mirrors.tuna.tsinghua.edu.cn/docker-ce"

OLD_PKGS="$(dpkg --get-selections docker.io docker-compose docker-doc podman-docker containerd runc 2>/dev/null | cut -f1 || true)"
if [ -n "${OLD_PKGS}" ]; then
    sudo apt-get remove -y ${OLD_PKGS}
fi

sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL "${DOCKER_MIRROR}/linux/${DOCKER_DISTRO}/gpg" \
    | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

sudo tee /etc/apt/sources.list.d/docker.sources >/dev/null <<EOF
Types: deb
URIs: ${DOCKER_MIRROR}/linux/${DOCKER_DISTRO}
Suites: $(. /etc/os-release && echo "${VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.gpg
EOF

sudo apt-get update
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin
