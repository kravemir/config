if [ "$0" = "/usr/sbin/lightdm-session" -a "$DESKTOP_SESSION" = "i3" ]; then
    export $(gnome-keyring-daemon -s)
fi

pathmunge () {
        if ! echo "$PATH" | /bin/grep -Eq "(^|:)$1($|:)" ; then
           if [ "$2" = "after" ] ; then
              PATH="$PATH:$1"
           else
              PATH="$1:$PATH"
           fi
        fi
}

pathmunge "${HOME}/.local/bin"
