# Dev Container Features

![CI](https://github.com/sebatec-eu/devcontainer-features/actions/workflows/test.yaml/badge.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

A collection of reusable [dev container Features](https://containers.dev/implementors/features/) from Sebatec, distributed via [GitHub Container Registry](https://github.com/sebatec-eu/devcontainer-features/pkgs/container).

### Quick Start

```jsonc
{
  "image": "ghcr.io/sebatec-eu/base-devcontainer:1",
  "features": {
    "ghcr.io/sebatec-eu/devcontainer-features/setup-forgejo-runner:1": {},
  },
}
```

## Features

| Feature                                         | Description                                                         |
| ----------------------------------------------- | ------------------------------------------------------------------- |
| [`setup-podman`](#setup-podman)                 | Installs podman-remote and podman-docker, mounts host Podman socket |
| [`setup-forgejo-runner`](#setup-forgejo-runner) | Installs Forgejo Runner for CI/CD testing                           |

> Versions are maintained in each feature's [`devcontainer-feature.json`](https://containers.dev/implementors/features/#devcontainer-feature-json-properties).

## Usage

### setup-podman

Installs `podman-remote` and `podman-docker`, and mounts the host's Podman socket into the container. This allows you to interact with the host's Podman daemon from inside the dev container.

**Prerequisites:** Your host must have Podman running with an accessible socket at `$XDG_RUNTIME_DIR/podman/podman.sock`.

```jsonc
{
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/sebatec-eu/devcontainer-features/setup-podman:1": {},
  },
}
```

After the feature is installed, you can use Podman inside the container:

```bash
$ podman ps
$ podman pull alpine
```

See [setup-podman README](src/setup-podman/README.md) and the [Podman documentation](https://podman.io/) for details.

### setup-forgejo-runner

Installs Forgejo Runner, enabling CI/CD job execution within the dev container. This feature automatically includes `setup-podman` as a dependency.

**Optional:** Specify a Forgejo Runner version (defaults to `latest`):

```jsonc
{
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/sebatec-eu/devcontainer-features/setup-forgejo-runner:1": {
      "version": "2.0.0",
    },
  },
}
```

Two commands are available after installation:

- **`forgejo-runner`** – The upstream Forgejo Runner CLI.
- **`forgejo-runner-exec`** – A convenience wrapper that invokes `forgejo-runner exec` with preconfigured defaults (container socket, default actions URL, and runner image).

```bash
$ forgejo-runner --version
$ forgejo-runner-exec
```

See [setup-forgejo-runner README](src/setup-forgejo-runner/README.md) and the [Forgejo Runner documentation](https://code.forgejo.org/forgejo/runner) for details.

## Repository Structure

Each feature lives in its own directory under `src/` and contains:

- **`devcontainer-feature.json`** – Feature metadata and configuration per the [dev container Feature specification](https://containers.dev/implementors/features/)
- **`install.sh`** – Installation entrypoint executed during container build
- **`README.md`** – Auto-generated documentation (see individual feature READMEs for details)

## Development & Testing

### Prerequisites

- Node.js and npm (for the dev container CLI)
- Podman (to build containers)
- The [Dev Containers CLI](https://github.com/devcontainers/cli)

### Running Tests

Test a specific feature:

```bash
devcontainer features test -f setup-podman .
devcontainer features test -f setup-forgejo-runner .
```

Run all tests:

```bash
devcontainer features test .
```

Tests are configured in `test/<feature>/scenarios.json` and `test/<feature>/test.sh`.

### CI/CD

The repository uses GitHub Actions for continuous integration:

- **[.github/workflows/test.yaml](.github/workflows/test.yaml)** – Runs feature tests on push and pull request
- **[.github/workflows/release.yaml](.github/workflows/release.yaml)** – Publishes features to GHCR and auto-generates documentation

## Contributing

Contributions are welcome! To add or improve a feature:

1. Create a new directory in `src/<feature-name>`
2. Add `devcontainer-feature.json`, `install.sh`, and `README.md` (or `NOTES.md`)
3. Create tests in `test/<feature-name>` with `scenarios.json` and `test.sh`
4. Run `devcontainer features test -f <feature-name> .` to verify
5. Open a pull request

All features must follow the [dev container Feature specification](https://containers.dev/implementors/features/).

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## References

- [Dev Containers Specification](https://containers.dev/)
- [Dev Container Features](https://containers.dev/implementors/features/)
- [Feature Distribution Spec](https://containers.dev/implementors/features-distribution/)
