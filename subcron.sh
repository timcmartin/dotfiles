#!/bin/bash

directory="$HOME/Dotfiles"
update_command="cd \"$directory\" && git submodule foreach --recursive git fetch"

eval $update_command

echo "Updated all Dotfiles."
