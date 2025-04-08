#!/bin/bash

k3d="$PWD/.devcontainer/k3d.yaml"

k3d cluster delete

echo ""
echo "Creating cluster ..."

k3d cluster create \
    --k3s-arg '--no-deploy=traefik@server:0' \
    --config "$k3d"
