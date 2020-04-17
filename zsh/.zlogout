if [[ -f ~/.zlogout.local ]]; then
    source ~/.zlogout.local
fi
echo "--$(tput bold) Switching back to $(tput setaf 6)$(echo $SSH_CONNECTION | cut -d' ' -f1 | xargs -I oldhost host oldhost | cut -d' ' -f5)$(tput sgr0) --$(tput sgr0)"
