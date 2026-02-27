
# Setup Podman (setup-podman)

Installs podman-remote and podman-docker, and mounts the host's Podman socket into the container.

## Example Usage

```json
"features": {
    "ghcr.io/sebatec-eu/devcontainer-features/setup-podman:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|

## Environment Variables

| Variable | Value |
|-----|-----|
| `DOCKER_HOST` | `unix:///tmp/podman-143d1b19-36fb-4790-9a48-eb7a5e5e378e.sock` |
| `CONTAINER_HOST` | `unix:///tmp/podman-143d1b19-36fb-4790-9a48-eb7a5e5e378e.sock` |

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/sebatec-eu/devcontainer-features/blob/main/src/setup-podman/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
