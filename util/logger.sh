#!/usr/bin/env bash

_log_info() {
    _expect_one_argument "$@"
    echo -e "\t $(tput bold)INFO$(tput sgr0)\t$1"
}

_log_error() {
    _expect_one_argument "$@"
    echo -e "\t$(tput bold)$(tput setaf 1)ERROR$(tput sgr0)\t$1"
}

_log_ok() {
    _expect_one_argument "$@"
    echo -e "\t   $(tput bold)$(tput setaf 2)OK$(tput sgr0)\t$1"
}

_log_continue() {
    _expect_one_argument "$@"
    echo -e "\t\t$1"
}

