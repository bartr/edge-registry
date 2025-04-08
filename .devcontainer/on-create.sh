#!/bin/bash

# Change shell to zsh for vscode
sudo chsh --shell /bin/zsh vscode

{
    echo ""

    echo "alias kuse='kubectl config use-context'"
    echo ""

    echo "export REPO_BASE=$PWD"
    echo "export REPO_FULL=\$(git remote get-url --push origin)"
    echo ""

} >> "$HOME/.zshrc"

# configure git
git config --global core.whitespace blank-at-eol,blank-at-eof,space-before-tab
git config --global pull.rebase false
git config --global init.defaultbranch main
git config --global fetch.prune true
git config --global core.pager more
git config --global diff.colorMoved zebra
git config --global devcontainers-theme.show-dirty 1
git config --global core.editor "nano -w"

echo "generating completions"
kubectl completion zsh > "$HOME/.oh-my-zsh/completions/_kubectl"
k3d completion zsh > "$HOME/.oh-my-zsh/completions/_k3d"
#kustomize completion zsh > "$HOME/.oh-my-zsh/completions/_kustomize"

echo "create local registry"
docker network create k3d
# k3d registry create registry.localhost --port 5500
# docker network connect k3d k3d-registry.localhost

#sudo apt-get update

# only run apt upgrade on pre-build
if [ "$CODESPACE_NAME" = "null" ]
then
    sudo apt-get update
    sudo apt-get upgrade -y
fi
