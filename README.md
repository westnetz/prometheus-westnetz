# prometheus-westnetz

This repository contains the glue to setup [Prometheus](https://prometheus.io/) together
with [Grafana](https://grafana.com/) as a frontend on [CoreOS](https://coreos.com/), using
[Ignition](https://coreos.com/ignition/docs/latest/) for that process.

## Usage

First, unlock the repository with [git-crypt](https://github.com/AGWA/git-crypt).

```console
git-crypt unlock
```

Then, generate the ingition config. This requires docker to be usable locally:

```console
make -C ignition config
```

Finally, spawn a machine. This example uses Digital Ocean:

```console
doctl compute droplet create prometheus.example.com \
    --size s-1vcpu-1gb \
    --region fra1 \
    --image coreos-stable \
    --ssh-keys your-key-id \
    --user-data-file ignition/config.json
```

You need to ensure that `prometheus.example.com` resolves to the IP of the machine
you just started.

Once the machine has booted completely, Prometheus should be up and running, and you
should be able to connect to Grafana using `admin:admin` as credentials, if you used
the example configuration.
