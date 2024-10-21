
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/firefox/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
export EDITOR="nvim"
export VISUAL="nvim"
export GPG_TTY=$(tty)  # Needed for Neomutt to work properly
unsetopt beep

# Plugins

source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
