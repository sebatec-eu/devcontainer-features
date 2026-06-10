#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'setup-mistral-vibe' feature with default options.

set -e

source dev-container-features-test-lib

check "mistral-vibe is installed at /home/vscode/.local/bin/vibe" test -f "/home/vscode/.local/bin/vibe"
check "mistral-vibe is executable" test -x "/home/vscode/.local/bin/vibe"
check "/tmp/.vibe-mount mount point exists" test -d "/tmp/.vibe-mount"
check "/home/vscode/.vibe is a symlink to /tmp/.vibe-mount" test -L "/home/vscode/.vibe"
check "/root/.vibe is a symlink to /tmp/.vibe-mount" test -L "/root/.vibe"

reportResults
