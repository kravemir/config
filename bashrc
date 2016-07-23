## Java config
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'


## Aliases
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias grep="grep --color=auto"

##################
# COMMAND PROMPT #
##################

git_prompt_tag() {
    # GIT repo
    if `git rev-parse --is-inside-work-tree 2> /dev/null || echo false`;
    then
        echo -n -e "\e[0m\e[33m git(`git rev-parse --abbrev-ref HEAD`)";
    fi;
}

prompt_tag_time() {
    echo -ne "\e[0m (`date '+%H:%M:%S'`)"
}

my_command_prompt() {
    RV=$1
    RETURN_VAL_OK=$'\e[033;01;32m\xe2\x9c\x93'
    RETURN_VAL_BAD=$'\e[033;01;31m\xe2\x9c\x97\e[033;00;31m:'"$RV"

    # RETURN VAL
    [[ $RV == 0 ]] && echo -ne "${RETURN_VAL_OK}" || echo -ne "${RETURN_VAL_BAD}"

    if [[ ${EUID} == 0 ]]; 
    then 
        echo -ne " \e[033;01;31m\h"
    else 
        echo -ne " \e[033;01;32m${2}\e[033;00;32m"
    fi

    echo -ne "\e[033;01;34m ${4/#$HOME/~}"

    # tags
    git_prompt_tag
    prompt_tag_time
}

PS1="\$(my_command_prompt \$? \u \h \w) \n\[\033[00m\]\$\[\033[00m\] "
