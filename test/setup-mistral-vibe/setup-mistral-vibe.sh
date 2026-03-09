#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'setup-mistral-vibe' feature with default options.

set -e

source dev-container-features-test-lib

check "mistral-vibe is installed at /home/vscode/.local/bin/vibe" test -f "/home/vscode/.local/bin/vibe"
check "mistral-vibe is executable" test -x "/home/vscode/.local/bin/vibe"
check ".vibe mount point exists" test -d "/home/vscode/.vibe"

reportResults
