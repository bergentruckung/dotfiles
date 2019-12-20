# .bashrc

function idontknowwhy() {
    while read -r response; do
        echo $response >> ~/.unauthorized_login
    done
}

#Check if it's actually me... >.>
# if [[ $(stat -c '%U' $(tty)) != $USER ]]; then user=$(stat -c '%U' $(tty)); printf "%s:\t%s\n" "$(date)" "$user" >> ~/.unauthorized_login; echo "Why are you in my shell?"; idontknowwhy $user; fi

#Colorcodes - use only if it's an interactive shell
if [[ $- == *i* ]]; then
    RED="$(tput setaf 1)"
    CYAN="$(tput setaf 6)"
    WHITE="$(tput setaf 255)"; fi

#Custom function to check if file exists - then source
include() {
    [[ $- == *i* ]] && [[ -e $1 ]] && source $1;
}

#Custom-Alias
alias ps="ps f -lF"
alias pstree="pstree -hpsa $*"
alias rm="rm"
alias ls="ls -lihsF --color"
alias grep="grep --color"
alias view="vim -R"
alias egrep="grep -E"
alias whatsmyip="curl ipinfo.io/ip"
alias ag='ag -s --color-path "1;44" --color-match "1;31" --color-line-number "1;37" '
alias r="fc -s"
alias opentodo="nvim ~/todos/"
alias sl="ls"
alias tree="tree -C"
alias less="less -Ri "

SHORTHOSTNAME=$(echo $HOST | sed -r 's/(\w+\.\w+)\..*/\1/')

[[ $- == *i* ]] && export PS1="\[${WHITE}\]$STABILITY[$SHLVL:$$]\u@[\[${RED}\]$SHORTHOSTNAME\[${WHITE}\]]\[${CYAN}\]\w\[${WHITE}$ \]" || export PS1="$STABILITY[$SHLVL:$$]\u@[$SHORTHOSTNAME]\w$ "

#Shell Options
shopt -s no_empty_cmd_completion
shopt -s dirspell
shopt -s cdspell
shopt -s nocaseglob
shopt -s autocd
shopt -s checkwinsize

#Auhtokhamplizions
complete -A hostname ssh

#Custom Functions
# Make sdiff better
function sdiff() {
    /usr/bin/sdiff -w $COLUMNS $*
}

#ssh and cd together
function sshcd() { hostname=$(echo "$1" | cut -d':' -f1 ); dirname=$(echo "$1" | cut -d':' -f2); ssh -t $hostname "cd $dirname; bash"; }

#ssh and cd; preserve current working directory
function sshcwd() { ssh -t $1 "cd $PWD ; bash"; }

#convert crt to pem
function crt2pem() {
    openssl x509 -in $1 -inform DES -out $(echo $1 | sed 's/crt/pem/') -outform PEM
}

function sssh() {
    if [[ -e $SSH_AUTH_SOCK ]]; then
            ssh -A $*
    else
        echo "Psst, where's your socket? I'm creating one for you ..."
        ssh-agent -a $SSH_AUTH_SOCK 2>/dev/null
        ssh-add 2>/dev/null
        ssh -A $*
    fi
}

function check_if_mounted() {
    # $1 to be the hostname list and $2 to be the location list
    readarray hosts < $1
    readarray locations < $2

    for (( i=1; i<=${#hosts[@]}; i++ )); do
        printf "Trying ${locations[$i]} on ${hosts[$i]} ... "
        ssh ${hosts[$i]} df -h ${locations[$i]}>/dev/null;
        if [[ $? != 0 ]]; then echo "${locations[$i]} is not mounted on ${hosts[$i]}"; else echo "OK"; fi
    done;
}

# ... because ctags are just amazing
function ctaghere() {
    /usr/bin/ctags --exclude=.git -R -f myctags .
}

# custom shortcuts
# Alt+? to add --help\n
if [[ $- == *i* ]]; then
    # ugh, I'm still trying to understand when would I freeze my shell
    stty -ixon
    bind '"\e?"':"\"--help\C-m\"";
    # bind '"jk":vi-movement-mode';
fi

# unset LS_COLORS for seoul256
unset LS_COLORS

# history related
export HISTSIZE=2000
export HISTCONTROL=ignoredups:erasedups

# GOPATH
export GOPATH=/u/sethuraj/golang

#Autocompletion script
#include ~/abhi_autocompletions/general_autocompletion.sh

# [[ $- == *i* ]] && [[ $TERM != 'screen-256color' ]] && (if tmux has-session; then exec tmux -2 attach; else exec tmux -2 ; fi)

# fzf, the fuzzy file finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# easy reference for colors: https://plumbum.readthedocs.io/en/latest/colors.html
FZF_DEFAULT_OPTS=
# custom FZF colorscheme
# FZF_DEFAULT_OPTS=" --color fg:0,bg:8,hl:124,hl+:160"
# being replaced by seoul256
FZF_DEFAULT_OPTS="--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168"
export FZF_DEFAULT_OPTS

function fdbat() {
    fd $* | fzf --preview 'bat --color="always" {}'
}

# use fzf for ssh
_fzf_complete_ssh() {
    _fzf_complete < <(cat $HOSTFILE)
}
_fzf_complete_ssh_notrigger() {
    FZF_COMPLETION_TRIGGER='' _fzf_complete_ssh
}

complete -F _fzf_complete_ssh_notrigger ssh

# use z to keep track of "frecently" used directories
if [ -d ~/.bash_completion.d ]; then
  for file in ~/.bash_completion.d/*; do
    . $file
  done
fi

# override bat config file
export BAT_CONFIG_PATH="~dotfiles/bat.conf"
