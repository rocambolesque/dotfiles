#!/bin/bash

ROOT="`pwd`"
VIM_PACKAGES=(ack-grep exuberant-ctags)

set -e

info () {
    printf "\r\033[00;m$1\033[0m\n"
}

warning () {
    printf "\r\033[00;33m$1\033[0m\n"
}

error () {
    printf "\r\033[00;31m$1\033[0m\n"
}

success () {
    printf "\r\033[00;32m$1\033[0m\n"
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
    info "setting up vim"
    vim_version=`vim --version | head -1 | grep -o '[[:digit:]]\.[[:digit:]]'` 
    info 'vim version: '$vim_version
}

install_vim_bundles () {
    info 'installing vim bundles'
    #vim -c 'BundleInstall' -c 'qa'
    success 'bundles installed'
}

install_vim_bundles_requirements () {
    info "installing vim bundles requirements"
    to_install=""
    for package in "${VIM_PACKAGES[@]}"
    do
        status=`aptitude search "${package}" | head -1 | grep -o '^.'`
        if [ "$status" != "i" ]
        then
            warning 'vim required package: '"${package}"' not installed'
            to_install+=" "$package
        else
            info 'vim required package: '"${package}"' installed'
        fi
    done
    if [ "$to_install" != "" ]
    then
        warning "run apt-get install$to_install"
    fi
}

install
setup_vim
install_vim_bundles
install_vim_bundles_requirements
info "done"
