#!/bin/bash
set -eux

# Install mistral-vibe as the determined user
if sudo -u vscode bash -c 'command -v uv' &> /dev/null; then
    sudo -u vscode bash -c 'export PATH="/home/vscode/.local/bin:$PATH" && uv tool install mistral-vibe'
else
    sudo -u vscode bash -c 'export PATH="/home/vscode/.local/bin:$PATH" && curl -LsSf https://mistral.ai/vibe/install.sh | bash'
fi

# Ensure the fixed mount target exists and expose it to all plausible users
# via a `~/.vibe` symlink. This lets any containerUser (vscode, root, ...)
# reach the host-mounted config under the familiar `~/.vibe` location.
mkdir -p /tmp/.vibe-mount
for user_home in /home/vscode /root; do
    user=$(basename "${user_home}")
    if ! id "${user}" &>/dev/null; then
        continue
    fi
    target="${user_home}/.vibe"
    # If `~/.vibe` already exists and is not a symlink (or not pointing at the
    # mount target), preserve the existing data by moving it to a timestamped
    # backup before creating the symlink. Existing symlinks (including broken
    # ones) are replaced in place by `ln -sfn`.
    if [ -e "${target}" ] && [ ! -L "${target}" ]; then
        backup="${target}.bak.$(date +%Y%m%d%H%M%S)"
        echo "setup-mistral-vibe: ${target} exists and is not a symlink; moving to ${backup}" >&2
        sudo -u "${user}" mv "${target}" "${backup}"
    fi
    sudo -u "${user}" ln -sfn /tmp/.vibe-mount "${target}"
done
