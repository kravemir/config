#!/bin/sh

PWD=`pwd`

function install_link() {

    # check if file exists, remove interactively
    if [ -e "$2" ] || [ -L "$2" ];
    then
        # check if existing file is link
        if [ -L "$2" ];
        then
            EXISTING_LINK_TARGET=`readlink -f "$2"`;
            # check if link points to target
            if [ "$1" == "$EXISTING_LINK_TARGET" ];
            then
                echo "[info] Already configured: '$2' points to '$1'";
                return;
            else
                echo "[error] Conflict: '$2' exists, it's link pointing to $EXISTING_LINK_TARGET";
                rm -i "$2";
            fi;
        else
            echo "[error] Conflict: '$2' exists";
            rm -i "$2";
        fi;

    fi;

    # install link
    echo "[info] Creating symbolic link '$2' pointing to '$1'"
    ln -sn -T "$1" "$2"
}

install_link "$PWD/bashrc" "$HOME/.bashrc"
install_link "$PWD/fluxbox/keys" "$HOME/.fluxbox/keys"
install_link "$PWD/fluxbox/overlay" "$HOME/.fluxbox/overlay"
install_link "$PWD/fluxbox/startup" "$HOME/.fluxbox/startup"
install_link "$PWD/ssh/config" "$HOME/.ssh/config"
install_link "$PWD/tint2rc" "$HOME/.config/tint2/tint2rc"
install_link "$PWD/vimrc" "$HOME/.vimrc"
install_link "$PWD/vim" "$HOME/.vim"
install_link "$PWD/Xresources" "$HOME/.Xresources"

# install packages
sudo apt install $(cat "$PWD/packages")
