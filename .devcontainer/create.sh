#!/bin/bash

echo "create local registry"
docker network create k3d
k3d registry create registry.localhost --port 5500
docker network connect k3d k3d-registry.localhost

k3d cluster delete

echo ""
echo "Creating cluster ..."

echo "Creating k3d cluster"
k3d cluster create \
    --k3s-arg --disable=traefik@server:0 \
    --registry-use k3d-registry.localhost:5500 \
    -p 30080:30080@server:0 \
    -p 31080:31080@server:0 \
    -p 32080:32080@server:0 \
    -p 80:80@loadbalancer \
    -p 443:443@loadbalancer \
    -p 8080:8080@loadbalancer
