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
