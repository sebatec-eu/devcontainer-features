#!/bin/bash
set -eux

if command -v uv &> /dev/null; then
    uv tool install mistral-vibe
else
    curl -LsSf https://mistral.ai/vibe/install.sh | bash
fi
