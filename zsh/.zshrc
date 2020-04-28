if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

# History
export HISTSIZE=100000000000
export SAVEHIST=100000000000
export HISTFILE=~/.zsh_history

# Keybindings
bindkey -v
export KEYTIMEOUT=0.5
zstyle ':completion:*' menu select
zmodload zsh/complist
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M viins "^?" backward-delete-char
bindkey -M viins "^w" backward-kill-word
bindkey -M vicmd "?" history-incremental-search-backward
bindkey -M vicmd "/" history-incremental-search-forward
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search
bindkey -M vicmd "^R" history-incremental-search-backward
bindkey -M vicmd "\e" accept-search
bindkey -M viins "^R" history-incremental-search-backward

# zsh options
setopt alwaystoend append_history auto_list auto_menu autocd autopushd chaselinks checkjobs extendedglob extended_history globdots hist_fcntl_lock hist_ignore_all_dups hist_reduce_blanks hist_save_no_dups hist_verify interactivecomments listpacked longlistjobs multios promptsubst pushdignoredups pushdsilent share_history transient_rprompt 

# Aliases
alias ps="ps f -lF"
alias pstree="pstree -hpsa $*"
alias rm="rm"
alias ls="ls -lihsF --color"
alias grep="grep --color"
alias view="vim -R"
alias egrep="grep -E"
alias whatsmyip="curl ipinfo.io/ip"
alias ag='ag -s --color-path "1;44" --color-match "1;31" --color-line-number "1;37" '
alias opentodo="nvim ~/todos/"
alias sl="ls"
alias tree="tree -C"
alias less="less -Ri "
alias History="history -fD"
alias hist=History
alias tasks=task list

# env variables
export EDITOR=vim

# Autoloads
autoload -U colors && colors
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

unset LS_COLORS
# old prompt
# export PS1="$STABILITY""[%L:$$]%n@[%F{red}%2m%f]%F{cyan}%15<...<%~%f%% "
# bergentruckung's prompt
export PS1="%(!.%F{green}root@%2m%f:%~.%(1j.*.)%B%2m%b:%B%F{cyan}%15<...<%~%f%b) %B%%%b "
export RPS1="%F{cyan}%B%t%b%f[%F{blue}%B%?%b%f]"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export PROMPT_EOL_MARK="%F{yellow}%B%K{black}%S%#%s%k%b%k%f"

TRAPINT() {
    print -n -u2 '^C'
    return $((128+$1))
}

_comp_options+=(globdots)

# FZF
if [[ -f ~/.fzf.zsh ]] && [[ -f ~/.fzf/shell/key-bindings.zsh ]]; then source ~/.fzf.zsh; fi

# being replaced by seoul256
# FZF_DEFAULT_OPTS="--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
# --color info:108,prompt:109,spinner:108,pointer:168,marker:168"
FZF_DEFAULT_OPTS="--color fg:14,bg:16,hl:4,fg+:237,bg+:14,hl+:16
--color info:14,prompt:14,spinner:14,pointer:16,marker:16"

export FZF_DEFAULT_OPTS
export FZF_COMPLETION_TRIGGER=';;'

## uncomment this block and change the file name to make ssh ;; tab completion work
# _fzf_complete_ssh() {
#     ARGS="$@"
#     if [[ $ARGS == 'ssh '* ]]; then
#         _fzf_complete "--reverse " "$@" < <(
#         cat ~/.devices)
#     else
#         eval "zle ${fzf_default_completion:-expand-or-complete}"
#     fi
# }
#
# fzf git magic
# -------------

function is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

function fzf-down() {
  fzf --height 50% "$@" --border --multi
}

function gF() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

function gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

function gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

function gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

function gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}


# A helper function to join multi-line output from fzf
join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bind-git-helper F b t r h
unset -f bind-git-helper


# override bat config file
export BAT_CONFIG_PATH="~/dotfiles/bat.conf"

function fdbat() {
    fd $* | fzf --preview 'bat --color="always" {}'
}

# Completions
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

# Direnv
eval "$(direnv hook zsh)"

# fasd
eval "$(fasd --init auto)"
if [[ -f ~/.fzf/fasd.plugin.zsh ]]; then source ~/.fzf/fasd.plugin.zsh; fi

show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
# uncomment this is you want PS1 to display the virtualenv name
# PS1='$(show_virtual_env)'$PS1

# zsh-syntax-highlighting

if [[ -f ~/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]]; then source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; fi
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
ZSH_HIGHLIGHT_STYLES[alias]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=blue
ZSH_HIGHLIGHT_STYLES[command-substitution]=fg=blue
ZSH_HIGHLIGHT_STYLES[command]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[comment]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=default
ZSH_HIGHLIGHT_STYLES[function]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[globbing]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=default
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=default
ZSH_HIGHLIGHT_STYLES[precommand]=fg=cyan,underline,bold

# sudo prompt
export SUDO_PROMPT="$(tput setaf 14)$(tput setab 16)> Behind this door must be the elevator to the King's castle. You're filled with determination.
> [sudo] password for %p: $(tput sgr0)"
