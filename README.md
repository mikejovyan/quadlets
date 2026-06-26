# quadlets

Podman quadlets.


## Containers

| Service | Description |
|---|---|
| [caddy](caddy/) | Web server and reverse proxy with automatic HTTPS |
| [forgejo](forgejo/) | Self-hosted git forge |
| [forgejo-runner](forgejo-runner/) | CI/CD runner for Forgejo |
| [ntfy](ntfy/) | Send push notifications to your phone or desktop via PUT/POST |

## Setup

1. Create podman rootless unit search path

```shell
mkdir ~/.config/containers/systemd/
```

2. Clone the repository and navigate to it

```shell
git clone https://forgejo.michael-andrea.com/mikejovyan/quadlets.git && cd quadlets
```

3. Copy the `<service>` folder to the systemd container directory.

```shell
cp -r <service>/ ~/.config/containers/systemd/
```

4. Create configuration files from `.example` files and edit as needed.

```shell
for f in ~/.config/containers/systemd/<service>/*.example; do
  cp "$f" "${f%.example}"
done
```

5. Reload systemd daemon and start the `<service>`.

```shell
systemctl --user daemon-reload && systemctl --user start <service>
```

## Useful commands

* Check the `<service>` status

```shell
systemctl --user status <service>
```

* View container logs

```shell
journalctl --user-unit <service>
```

* Pull and apply updates — image must be fully qualified and tagged `latest` (e.g. `docker.io/foo/bar:latest`)

```shell
podman auto-update
```

* Keep services running when not logged in

```shell
loginctl enable-linger $USER
```

## References

- [https://github.com/herzenschein/herz-quadlet](https://github.com/herzenschein/herz-quadlet)
- [https://codeberg.org/stefanfrede/quadlets](https://codeberg.org/stefanfrede/quadlets)
