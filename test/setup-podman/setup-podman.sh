#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'setup-podman' feature with default options.

set -e

source dev-container-features-test-lib

check "podman-remote is installed" which podman
check "DOCKER_HOST is set" test -n "${DOCKER_HOST}"
check "CONTAINER_HOST is set" test -n "${CONTAINER_HOST}"
check "DOCKER_HOST points to socket" bash -c 'echo "$DOCKER_HOST" | grep -q "^unix://"'
check "CONTAINER_HOST points to socket" bash -c 'echo "$CONTAINER_HOST" | grep -q "^unix://"'

reportResults
