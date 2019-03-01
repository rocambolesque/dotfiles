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
    git submodule update --init
    vim_version=`vim --version | head -1 | grep -o '[[:digit:]]\.[[:digit:]]'` 
    info 'vim version: '$vim_version
    ln -s vim/pack/ ~/.vim/pack
}

setup_tmux() {
    info 'setting up tmux'
    git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux-resurrect/
    success 'tmux setup'
}

install
setup_vim
info "done"
