#!/bin/bash
set -eux

# Install mistral-vibe as the determined user
if sudo -u vscode bash -c 'command -v uv' &> /dev/null; then
    sudo -u vscode bash -c 'export PATH="/home/vscode/.local/bin:$PATH" && uv tool install mistral-vibe'
else
    sudo -u vscode bash -c 'export PATH="/home/vscode/.local/bin:$PATH" && curl -LsSf https://mistral.ai/vibe/install.sh | bash'
fi

mkdir -p /tmp/.vibe-mount
