#!/usr/bin/env bash

# function to symlink files after cleaning up
# $1: target
# $2: link_name
_symlink_file() {
    _expect_two_arguments "$@"

    if [ -L $2 ] && [ "$(readlink -v -m $2)" != "$dotfiles_root/$1" ]; then
        _remove_existing_symlink $2
    elif [ ! -L $2 ] && [ -e $2 ]; then
        _backup_file $2
    else
        _log_info "symlink already set correctly - skipping..."
        return
    fi

    _write_symlink $1 $2
}

_write_symlink() {
    _expect_two_arguments "$@"
    ln -s $1 $2
    if [ $? -ne 0 ]; then
        _log_error "unable to set symlink - aborting..."
        _log_continue "target:\t$1"
        _log_continue "link_name:\t$2"
        exit 1
    fi

    _log_ok "created symlink $2 successfully"
}

_backup_file() {
    _expect_one_argument "$@"
    path=${dotfiles_root}/backup
    mkdir --parents $path
    if [ $? -eq 0 ]; then
        _log_info "created backup directory $path"
    fi

    mv -v $1 "$path/$1"
    if [ $? -ne 0 ]; then
        _log_error "unable to backup file - aborting..."
        _log_continue "file:\t$path/$1"
        exit 1
    fi

    _log_ok "created backup of file $path/$1 successfully"
}

_remove_existing_symlink() {
    _expect_one_argument "$@"
    rm -v $1
    if [ $? -ne 0 ]; then
        _log_error "unable to remove existing symlink - aborting..."
        _log_continue "file:\t$1"
        exit 1
    fi

    _log_info "removed existing symlink $1"
}

_expect_one_argument() {
    if [ "$#" -ne 1 ]; then
        _log_error "wrong number of arguments: 1 argument expected"
        exit 1
    fi
}

_expect_two_arguments() {
    if [ "$#" -ne 2 ]; then
        _log_error "wrong number of arguments: 2 arguments expected"
        exit 1
    fi
}

available() {
    hash "${1}" > /dev/null 2>&1
}

isUbuntu() {
    lsb_release -a > /dev/null 2>&1 | grep Ubuntu > /dev/null 2>&1
}

isRaspbian() {
    lsb_release -a > /dev/null 2>&1 | grep Raspbian > /dev/null 2>&1
}

