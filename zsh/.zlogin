# Get unique users
function get_unique_users {
    if [[ $(echo $wtmp_users | wc -l) -gt 5 ]]; then
        echo $wtmp_users | sort -u | head -5 | tr '\n' ',' | sed "s/$/.../g"
    else
        echo $wtmp_users | sort -u | paste -sd,
    fi
}

# Prints text in green
function print_with_green {
    tput setaf 2; echo $1; tput sgr0;
}

# Source local zlogin
if [[ -f ~/.zlogin.local ]]; then
    source ~/.zlogin.local
fi
