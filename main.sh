#!/usr/bin/env bash

source "util/logger.sh"

if [ -e config.conf ]; then
    cp util/config.std config.conf
    if [ $? -ne 0 ]; then
        _log_error "unable to create config file"
        exit 1
    fi
    _log_ok "config created - please edit config.conf to fit your preferences"
    exit 0
fi

dotfiles_root=$(pwd)

source "config.conf"
source "util/functions.sh"

for DIR in ./*/
do
    var=$(basename $DIR)
    if [ "${!var}" = "true" ]; then
        source "$var/module.sh"
    fi
done;

exit 0

