#!/usr/bin/env bash
set -euo pipefail

if command -v fish >/dev/null 2>&1; then
    echo "fish already installed, skipping"
    exit 0
fi

sudo apt-get update
sudo apt-get install -y fish
