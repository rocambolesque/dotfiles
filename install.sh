#!/bin/bash

ROOT="`pwd`"

set -e

info () {
    printf "  [ \033[00;34mINFO\033[0m ] $1\n"
}

success () {
    printf "\r\033[2K  [ \033[00;32mSUCCESS\033[0m ] $1\n"
}

install () {
    info 'installing dotfiles'

    for dotfile in `ls`
    do
        if [ "$dotfile" == "install.sh" ]
        then
            continue
        fi
        dest="$HOME/.`basename \"${dotfile%.*}\"`"
        rm -rf $dest
        ln -s $ROOT/$dotfile $dest
        success "linked $ROOT/$dotfile -> $dest"
    done
}

setup_vim () {
    info 'installing vim bundles'

    vim -c 'BundleInstall' -c 'qa'

    success 'bundles installed'
}

install
setup_vim
info "done"
