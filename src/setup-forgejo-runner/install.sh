#!/bin/bash
set -xe

ARCH=$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/')
RUNNER_VERSION=$(curl -X 'GET' https://data.forgejo.org/api/v1/repos/forgejo/runner/releases/latest | jq .name -r | cut -c 2-)
FORGEJO_URL="https://code.forgejo.org/forgejo/runner/releases/download/v${RUNNER_VERSION}/forgejo-runner-${RUNNER_VERSION}-linux-${ARCH}"

curl -o /usr/local/bin/forgejo-runner "${FORGEJO_URL}"
chmod +x /usr/local/bin/forgejo-runner

cat >/usr/local/bin/forgejo-runner-exec<<EOF
#!/bin/bash
exec forgejo-runner exec --container-daemon-socket "\${DOCKER_HOST#unix://}" --default-actions-url=https://forge.sebatec.eu --image=ghcr.io/sebatec-eu/stable-forgejo-runner:1 "\$@"
EOF
chmod +x /usr/local/bin/forgejo-runner-exec

# XXX: fix stupid access error
echo "" > /tmp/.devcontainer-setup
