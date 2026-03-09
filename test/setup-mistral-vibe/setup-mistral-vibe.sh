#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'setup-mistral-vibe' feature with default options.

set -e

source dev-container-features-test-lib

echo $PATH
# uv tool list --show-paths
find / -name vibe 2> /dev/null

check "mistral-vibe is installed" which vibe
check "mistral-vibe is executable" test -x "$(which vibe)"
check ".vibe mount point exists" test -d "/home/vscode/.vibe"

reportResults
