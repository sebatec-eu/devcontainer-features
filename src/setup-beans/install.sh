#!/bin/bash
set -eux

# Determine the version to install
VERSION="${FEATURE_BEANS_VERSION:-latest}"

# Construct the download URL
if [ "$VERSION" = "latest" ]; then
    DOWNLOAD_URL="https://github.com/hmans/beans/releases/latest/download/beans_Linux_x86_64.tar.gz"
else
    DOWNLOAD_URL="https://github.com/hmans/beans/releases/download/${VERSION}/beans_Linux_x86_64.tar.gz"
fi

# Install beans
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"
curl -LsSf "$DOWNLOAD_URL" | tar xz
sudo mv beans /usr/local/bin/
cd -

# XXX: fix stupid access error
echo "" > /tmp/.devcontainer-setup
