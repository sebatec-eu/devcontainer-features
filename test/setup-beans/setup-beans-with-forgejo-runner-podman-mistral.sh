#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'setup-beans' feature with 'setup-forgejo-runner', 'setup-podman', and 'setup-mistral-vibe'.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "beans is installed" which beans
check "beans is executable" beans version
check "forgejo-runner is installed" which forgejo-runner
check "forgejo-runner is executable" forgejo-runner --version
check "forgejo-runner-exec is installed" which forgejo-runner-exec
check "forgejo-runner-exec is executable" forgejo-runner-exec --help
check "podman is installed" which podman
check "podman is executable" podman --version
check "mistral-vibe is installed at /home/vscode/.local/bin/vibe" test -f "/home/vscode/.local/bin/vibe"
check "mistral-vibe is executable" test -x "/home/vscode/.local/bin/vibe"
check ".vibe mount point exists" test -d "/tmp/.vibe-mount"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
