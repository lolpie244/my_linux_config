# settings
setopt extendedglob
unsetopt beep

export PATH="$PATH:${HOME}/.local/bin:${HOME}/.cargo/bin"
export SUDO_EDITOR=/usr/bin/nvim

# bindings
bindkey -v
bindkey '^[n' up-line-or-history
bindkey '^[N' down-line-or-history

# aliases
alias ls="ls --color=auto"
alias icat="kitty icat"
alias ssh_add='eval "$(ssh-agent -s)";ssh-add'
alias ssh="kitty +kitten ssh -R /tmp/forwarded:$(echo ${KITTY_LISTEN_ON} | sed "s/.*://g")"
alias screenkey="GDK_BACKEND=x11 screenkey"

alias make_local="make -f local.Makefile"
alias make_local_create="cp ~/.config/local-makefile/local.Makefile ."

# HISTORY
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

source ${HOME}/.config/zsh-fzf-history-search/zsh-fzf-history-search.zsh

zstyle :compinstall filename "${HOME}/.zshrc"
autoload -Uz compinit
compinit
eval "$(oh-my-posh init zsh --config ~/.config/oh_my_posh_config.json)"



