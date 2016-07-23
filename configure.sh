#!/bin/sh

PWD=`pwd`

function install_link() {

    # check if file exists, remove interactively
    if [ -f "$2" ];
    then
        rm -i "$2";
    fi;

    # check if link exists, remove interactively
    if [ -L "$2" ];
    then
        # TODO: check target, conditionally remove / update
        rm -i "$2";
    fi;

    # install link
    ln -sn -T "$1" "$2"
}

install_link "$PWD/bashrc" "$HOME/.bashrc"
install_link "$PWD/vimrc" "$HOME/.vimrc"
install_link "$PWD/vim" "$HOME/.vim"
