#!/bin/sh
set -e

export RANCHER_IP=$(wget -qO- http://rancher-metadata.rancher.internal/latest/self/container/primary_ip)

/opt/app/bin/app $@
