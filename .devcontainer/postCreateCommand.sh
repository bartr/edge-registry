#!/bin/bash

echo "update oh-my-zsh"
git -C "$HOME/.oh-my-zsh" pull

# todo - remove once bug is fixed
# downgrade urllib for http bug
#pip install 'urllib3<2'

{
    echo ""
    echo "export CLUSTER_NAME=${CODESPACE_NAME%-*}" >> "$HOME/.zshrc"
} >> "$HOME/.oh-my-zsh/custom/alias.zsh"

exit 0

echo "Creating k3d cluster"
k3d cluster create \
    --k3s-arg --disable=traefik@server:0 \
    -p 30080:30080@server:0 \
    -p 31080:31080@server:0 \
    -p 32080:32080@server:0 \
    -p 80:80@loadbalancer \
    -p 443:443@loadbalancer \
    -p 8080:8080@loadbalancer
