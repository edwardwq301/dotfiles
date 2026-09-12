#!/usr/bin/env bash
set -euo pipefail

if command -v tmux >/dev/null 2>&1; then
    echo "tmux already installed, skipping"
    exit 0
fi

sudo apt-get update
sudo apt-get install -y tmux
