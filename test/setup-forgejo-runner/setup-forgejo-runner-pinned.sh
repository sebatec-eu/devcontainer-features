#!/bin/bash

# This test file will be executed against scenarios from scenarios.json
# where it's configured with setup-forgejo-runner pinned to a specific version.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests for pinned version
check "forgejo-runner is installed" which forgejo-runner
check "forgejo-runner is executable" forgejo-runner --version
check "forgejo-runner-exec is installed" which forgejo-runner-exec
check "forgejo-runner-exec is executable" forgejo-runner-exec --help

# Report results
reportResults
