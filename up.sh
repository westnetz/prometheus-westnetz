#!/bin/sh

set -e

PATH="/opt/bin:$PATH"

cd "$(dirname "$0")"
touch ../prometheus-westnetz-acme.json
chmod 0600 ../prometheus-westnetz-acme.json

export HOSTNAME="$(hostname -f)"

sed -i "s/@@ACME_EMAIL@@/$ACME_EMAIL/" traefik.toml
sed -i "s/@@SNMP_COMMUNITY@@/$SNMP_COMMUNITY/" snmp-exporter/snmp.yml

docker network create traefik 2>/dev/null || true

# Reset conntrack state so SNMP arrives at container after possible IP change
conntrack -D -p udp

exec docker-compose up
