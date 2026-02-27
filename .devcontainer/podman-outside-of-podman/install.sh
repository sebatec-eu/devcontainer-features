#!/bin/bash
set -eux

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y podman-remote podman-docker
apt-get autoremove -y
apt-get clean -y
rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Check if it is possible to run podman within this container
# podman         run           --rm           docker.io/library/alpine             id
