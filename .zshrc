# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="gentoo"
# ZSH_THEME="prose"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
CLICOLOR=1
OS=`uname -s`

# Macbook Pro battery percent
function battery_charge {
    echo `~/.bin/battery.py` 2>/dev/null
}

# Mac
if [[ "$OS" == 'Darwin' ]]; then
    #RPROMPT='$(battery_charge)'
    #LSCOLORS=exfxcxdxbxegedabagacad
    LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
    PATH="$PATH:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin"
    export LANG='en_US.UTF-8'
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
fi

# Linux
if [[ "$OS" == 'Linux' ]]; then
    TERM=xterm-256color
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

# python
[[ -s "$HOME/.runtime/bin" ]] && . "$HOME/.runtime/bin/activate"
[[ -s "$HOME/.pystartup.py" ]] && PYTHONSTARTUP=$HOME/.pystartup.py

# utils
[[ -s "$HOME/.bin" ]] && PATH="$HOME/.bin:$PATH"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias lx="$HOME/Dropbox/ratazzi/utils/xunlei-lixian/lixian_cli.py"
