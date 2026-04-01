#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'setup-beans' Feature with no options.

set -e

# Source the scenario test for consistency
source "$(dirname "$0")/setup-beans.sh"
