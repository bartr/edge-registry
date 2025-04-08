#!/bin/bash

# this runs at Codespace creation - not part of pre-build

echo "post-create start"
echo "$(date +'%Y-%m-%d %H:%M:%S')    post-create start" >> "$HOME/status"

echo "update oh-my-zsh"
git -C "$HOME/.oh-my-zsh" pull

# todo - remove once bug is fixed
# downgrade urllib for http bug
pip install 'urllib3<2'

echo "post-create complete"
echo "$(date +'%Y-%m-%d %H:%M:%S')    post-create complete" >> "$HOME/status"
