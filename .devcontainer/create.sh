#!/bin/bash

echo "create local registry"
docker network create k3d
k3d registry create registry.localhost --port 5500
docker network connect k3d k3d-registry.localhost

k3d cluster delete

echo ""
echo "Creating cluster ..."

k3d cluster create \
    --k3s-arg '--no-deploy=traefik@server:0' \
    --config "k3d_yaml"
