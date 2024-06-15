# get ctrl+s to work for searching forward
# had to put this before the p10k stuff otherwise ran into error
# https://superuser.com/a/1067896
stty -ixon

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

# history config
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
setopt sharehistory
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# make ctrl+w delete words separated by '/' instead of only space
# https://unix.stackexchange.com/a/392199
autoload -U select-word-style
select-word-style bash
export WORDCHARS='/'

# use emacs line editing keybindings to behave like bash
bindkey -e

# disable r built-in
disable r

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

# plugins
# i cloned them all to $ZSH/plugins
fpath=($ZSH/plugins/zsh-completions/src $fpath)
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# theme

# starship prompt
# currently still using p10k for now, but uncomment to switch
# eval "$(starship init zsh)"

# p10k theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $ZSH/plugins/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh