#!/usr/bin/env bash
set -euo pipefail

if command -v git >/dev/null 2>&1; then
    echo "git already installed, skipping"
    exit 0
fi

sudo apt-get update
sudo apt-get install -y git
