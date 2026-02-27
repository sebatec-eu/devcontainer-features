#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'setup-forgejo-runner' feature with default options.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "forgejo-runner is installed" which forgejo-runner
check "forgejo-runner is executable" forgejo-runner --version
check "forgejo-runner-exec is installed" which forgejo-runner-exec
check "forgejo-runner-exec is executable" forgejo-runner-exec --help

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
