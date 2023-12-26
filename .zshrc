
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lolpie/.zshrc'

autoload -Uz compinit
compinit
eval "$(oh-my-posh init zsh --config ~/.config/oh_my_posh_config.json)"


# aliases
alias ls="ls --color=auto"
alias icat="kitty icat"
alias ssh_add='eval "$(ssh-agent -s)";ssh-add'
alias ssh="kitty +kitten ssh -R /tmp/forwarded:$(echo ${KITTY_LISTEN_ON} | sed "s/.*://g")"
eval "$(oh-my-posh init zsh --config ~/.config/oh_my_posh_config.json)"
