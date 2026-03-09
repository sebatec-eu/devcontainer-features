#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'setup-mistral-vibe' feature with default options.

set -e

source dev-container-features-test-lib

check "mistral-vibe is installed" which mistral-vibe
check "mistral-vibe is executable" test -x "$(which mistral-vibe)"
check ".vibe mount point exists" test -d "/home/vscode/.vibe"

reportResults
