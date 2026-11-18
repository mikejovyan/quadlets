# quadlets

Podman quadlets.

## Quadlets

| Service | Description |
|---|---|
| [caddy](caddy/) | Web server and reverse proxy with automatic HTTPS |
| [forgejo](forgejo/) | Self-hosted git forge |
| [forgejo-runner](forgejo-runner/) | CI/CD runner for Forgejo Actions |
| [ntfy](ntfy/) | Send push notifications to your phone or desktop via PUT/POST |
| [vscode-server](vscode-server/) | Run VS Code on any machine anywhere and access it in the browser |

## Useful commands

* Check the `<service>` status

```shell
systemctl --user status <service>
```

* View container logs

```shell
journalctl --user-unit <service>
```

* Pull and apply updates — image must be fully qualified and tagged `latest` (e.g. `quay.io/foo/bar:latest`)

```shell
podman auto-update
```
