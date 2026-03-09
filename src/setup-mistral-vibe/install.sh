#!/bin/bash
set -eux

# Install mistral-vibe as the determined user
if sudo -u vscode bash -c 'command -v uv' &> /dev/null; then
    sudo -u vscode uv tool install mistral-vibe
else
    sudo -u vscode bash -c 'curl -LsSf https://mistral.ai/vibe/install.sh | bash'
fi

# XXX: fix stupid access error
echo "" > /tmp/.devcontainer-setup
