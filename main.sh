#!/usr/bin/env bash

dotfiles_root=$(pwd)

source "config.conf"
source "util/logger.sh"
source "util/functions.sh"

for DIR in ./*/
do
    var=$(basename $DIR)
    if [ "${!var}" = "true" ]; then
        source "$var/module.sh"
    fi
done;

exit 0

