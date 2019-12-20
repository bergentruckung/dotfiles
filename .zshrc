# History
export HISTSIZE=100000000
export SAVEHIST=100000000
export HISTFILE=~/.zsh_history
setopt inc_append_history share_history hist_verify hist_save_no_dups hist_reduce_blanks hist_ignore_all_dups

# Keybindings
bindkey -v
export KEYTIMEOUT=1
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
bindkey -M viins "^R" history-incremental-search-backward

# zsh common options
setopt autocd autopushd chaselinks pushdignoredups pushdsilent extendedglob interactivecomments alwaystoend listpacked checkjobs longlistjobs promptsubst multios correct correctall transient_rprompt auto_list auto_menu globdots

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

# env variables
export EDITOR=vim

# Autoloads
autoload -U colors && colors
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

unset LS_COLORS
export PS1="$STABILITY""[%L:$$]%n@[%F{red}%2m%f]%F{cyan}%15<...<%~%f%% "
export RPS1="[%F{blue}%?%f]"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

TRAPINT() {
    print -n -u2 '^C'
    return $((128+$1))
}

_comp_options+=(globdots)

# FZF
if [[ -f ~/.fzf.zsh ]] && [[ -f ~/.fzf/shell/key-bindings.zsh ]]; then source ~/.fzf.zsh; fi

# being replaced by seoul256
FZF_DEFAULT_OPTS="--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168"
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
ZSH_HIGHLIGHT_STYLES[precommand]=fg=red,underline,bold
