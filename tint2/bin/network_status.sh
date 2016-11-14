ip addr show |
awk '/^[^ ]/ && NR!=1 {print ""}
    /^[0-9]*:/ {printf "%s", $2}
    /inet / {printf " %s", $2}
    END {print ""}' |
grep -ve '^lo\|:$' |
sed -e 's/\/\([0-9]*\)$//g'
