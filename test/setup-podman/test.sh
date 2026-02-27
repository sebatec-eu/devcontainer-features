#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'setup-podman' Feature with no options.

set -e

source dev-container-features-test-lib

check "podman-remote is installed" which podman
check "DOCKER_HOST is set" test -n "${DOCKER_HOST}"
check "CONTAINER_HOST is set" test -n "${CONTAINER_HOST}"

reportResults
