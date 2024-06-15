# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/python@3.9/libexec/bin:/opt/homebrew/bin:/usr/local/opt/python/libexec/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/ming/.oh-my-zsh"

# VARIABLES
MINGLOGS="${HOME}/tools/minglogs/"
VENVPATH="${HOME}/venvs"
PYTHONPATH_BREW="/opt/homebrew/bin/python3"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# [ming] added docker plugin to enable tab completion
plugins=(git docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# custom keybinding to make Ctrl+U delete from cursor position rather than the whole line
bindkey \^U backward-kill-line

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# enable man pages for built-ins on zsh
# https://unix.stackexchange.com/a/721067
alias zconfig="vim ~/.zshrc"
alias zreload="source ~/.zshrc"

# intel version of brew installed
# https://diewland.medium.com/how-to-install-python-3-7-on-macbook-m1-87c5b0fcb3b5
alias ibrew="arch -x86_64 /usr/local/bin/brew"

# python venvs
alias ve39="source ~/venvs/ming-3.9/bin/activate"
alias ve37="source ~/venvs/ming-3.7/bin/activate"
alias ve50="source ~/omscs-local/cs6250/venv/cs6250-pr1/bin/activate"
alias veiis="source ~/venvs/cs6035-3.10/bin/activate"

# quick access to directories
alias cdp="cd ~/projects"
alias cdo="cd ~/omscs-local/"

# bare git repo for dotfiles
alias dotgit='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# icloud drive
alias cdi='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/docs/'

# vscode projects
# alias dcodesat='code --profile /Users/ming/Library/Mobile\ Documents/com~apple~CloudDocs/docs/omscs/vscodeworkspaces/cs6340.code-workspace'

alias dcodegios='code --profile /Users/ming/Library/Mobile\ Documents/com~apple~CloudDocs/docs/omscs/vscodeworkspaces/ubuntu.code-workspace'

alias sshu='ssh ming@mz-ubuntu'
alias sshm='ssh cs6035@192.168.1.30'
alias sshsd='ssh deck@steamdeck'

# disable r built-in
disable r

# Functions

# Open file for editing in vim from kitty terminal
vimkt ()
{
    kitty --single-instance sh -c "vim $1" > ${MINGLOGS}/kitty_vim_log.txt 2>&1 &
}

# vimal ()
# {
# 	alacritty -e vim $1 > ${MINGLOGS}/ming_alacritty_log.txt 2>&1 &
# }
#

# create a new python virtual environment and activate it
# create_venv venv_name
cvenv ()
{
    echo "Creating new venv: $1"
    echo "Using ${PYTHONPATH_BREW} with version $(${PYTHONPATH_BREW} --version)"
    ${PYTHONPATH_BREW} -m venv ${VENVPATH}/$1
source ${VENVPATH}/$1/bin/activate
}

# activate existing venv
# activate_venv venv_name
avenv () {
source ${VENVPATH}/$1/bin/activate
}

# list contents of venv folder
lvenvs () {
  ls -l ${VENVPATH}
}

# delete an existing venv
dvenv () {
  echo "Will delete venv: ${VENVPATH}/$1. Press enter to continue."
  read ans
  rm -r ${VENVPATH}/$1
}


. /opt/homebrew/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /Users/ming/.config/op/plugins.sh
export PATH="/opt/homebrew/opt/imagemagick@6/bin:$PATH"
