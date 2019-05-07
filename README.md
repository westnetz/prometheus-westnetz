# prometheus-westnetz

This repository contains the glue to setup [Prometheus](https://prometheus.io/) together
with [Grafana](https://grafana.com/) as a frontend using
[Docker Compose](https://docs.docker.com/compose/).

## Usage

Before starting the stack, you need to provide it with some configuration parameters. As
a starting point, you can use the example configuration:

```console
cp .env.example .env
```

The stack should be started using systemd. A suitable unit looks like this:

```ini
[Unit]
Description=Docker compose setup for Prometheus with Grafana
After=docker.service
Requires=docker.service

[Service]
EnvironmentFile=/srv/prometheus-westnetz/.env
WorkingDirectory=/srv/prometheus-westnetz
ExecStart=/srv/prometheus-westnetz/up.sh
ExecStop=/usr/bin/docker-compose down

[Install]
WantedBy=multi-user.target
```

Once this unit is present, you should be able to start the stack using:

```console
systemctl start prometheus-westnetz.service
```
