#!/usr/bin/env bash

PWD=`pwd`

function install_link() {

    mkdir -p $(dirname $2)

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
install_link "$PWD/profile" "$HOME/.profile"
install_link "$PWD/fluxbox/keys" "$HOME/.fluxbox/keys"
install_link "$PWD/fluxbox/overlay" "$HOME/.fluxbox/overlay"
install_link "$PWD/fluxbox/startup" "$HOME/.fluxbox/startup"
install_link "$PWD/ssh/config" "$HOME/.ssh/config"
install_link "$PWD/tint2rc" "$HOME/.config/tint2/tint2rc"
install_link "$PWD/tint2/bin/network_status.sh" "$HOME/.config/tint2/bin/network_status.sh"
install_link "$PWD/vimrc" "$HOME/.vimrc"
install_link "$PWD/vim" "$HOME/.vim"
install_link "$PWD/Xresources" "$HOME/.Xresources"
install_link "$PWD/i3" "$HOME/.config/i3"
install_link "$PWD/i3status" "$HOME/.config/i3status"
install_link "$PWD/bin/i3exit.sh" "$HOME/.local/bin/i3exit.sh"
install_link "$PWD/bin/i3exit.sh" "$HOME/.local/bin/i3exit"

# install packages
sudo apt install $(cat "$PWD/packages")
