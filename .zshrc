# get ctrl+s to work for searching forward
# had to put this before the p10k stuff otherwise ran into error
# https://superuser.com/a/1067896
stty -ixon

fpath=(~/.docker/completions $fpath)

autoload -Uz compinit
compinit

# === this was automatically added by p10k ===
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# ===

export PATH="/opt/homebrew/opt/python@3.9/libexec/bin:/opt/homebrew/bin:/usr/local/opt/python/libexec/bin:$PATH"
export ZSH=$HOME/.zsh

# add highlighting for man pages (uses bat)
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# make ctrl+w delete words separated by '/' instead of only space
# https://lgug2z.com/articles/sensible-wordchars-for-most-developers/
# WORDCHARS: set of characters *in addition to alphanumeric* that should be treated as part of a word
# (not to be used a sword separators)
# this is the default value but with the following removed: /._-
export WORDCHARS='*?[]~=&;!#$%^(){}<>'


# history config
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
setopt sharehistory
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS


# plugins
# i cloned them all to $ZSH/plugins
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# prompt stuff
# starship prompt
# currently still using p10k for now, but uncomment to switch
# eval "$(starship init zsh)"

# p10k theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $ZSH/plugins/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# keybindings
# use emacs line editing keybindings to behave like bash
bindkey -e


# aliases
# intel version of brew installed
# https://diewland.medium.com/how-to-install-python-3-7-on-macbook-m1-87c5b0fcb3b5
alias ibrew="arch -x86_64 /usr/local/bin/brew"

alias zconfig="vim ~/.zshrc"
alias zreload="source ~/.zshrc"

# quick access to directories
alias cdp="cd ~/projects"
alias cdo="cd ~/omscs-local/"
alias cdi='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/docs/'

# bare git repo for dotfiles
alias dotgit='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
