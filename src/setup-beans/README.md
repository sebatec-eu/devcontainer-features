
# Setup Beans (setup-beans)

Installs the beans CLI — a flat-file issue tracker for humans and AI coding agents (github.com/hmans/beans)

## Example Usage

```json
"features": {
    "ghcr.io/sebatec-eu/devcontainer-features/setup-beans:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Version of beans to install | string | latest |

## What is Beans?

**Beans** is a CLI-based flat-file issue tracker designed for both humans and AI agents. It stores all tasks and issues as Markdown files in a `.beans/` directory, making it lightweight, version-control friendly, and easy to integrate into any workflow.

## Why This Feature?

Installing beans in your devcontainer makes it immediately available for:

- **Local Developer Workflows** — Manage project tasks directly from the terminal without extra setup.
- **Coding Agent Workflows** — Claude Code and other AI agents can read, write, and manage tasks within the same container, enabling agentic task tracking and multi-turn conversations around work items.

Having beans pre-installed ensures consistency across local and remote development environments.

## Installation with Version Pinning

By default, this feature installs the latest version of beans. To pin a specific version, include the `version` option:

```json
"features": {
  "ghcr.io/sebatec-eu/devcontainer-features/setup-beans:1": {
    "version": "v0.4.2"
  }
}
```

## CLI Examples

After installation, you can use beans immediately:

```bash
# Check the installed version
beans version

# List all tasks
beans list

# Open the interactive TUI (task user interface)
beans tui

# Create a new task (interactive)
beans new

# Add a task directly
beans add "Fix login bug"
```

For more commands and detailed usage, see the [beans documentation](https://github.com/hmans/beans).

## Agent Configuration

The most basic way to teach your agent about Beans is to simply add the following instruction to your `AGENTS.md`, `CLAUDE.md`, or equivalent file:

```
**IMPORTANT**: before you do anything else, run the `beans prime` command and heed its output.
```

Some agents and devcontainer tools provide mechanisms to automate this step:

- **Claude Code hooks** — Add to `.claude/settings.json`:
  ```json
  {
    "hooks": {
      "on_start": ["beans prime"]
    }
  }
  ```

For comprehensive documentation, examples, and advanced usage, visit the [beans GitHub repository](https://github.com/hmans/beans).


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/sebatec-eu/devcontainer-features/blob/main/src/setup-beans/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
