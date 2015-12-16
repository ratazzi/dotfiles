# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is $FISH/custom)
set fish_custom $HOME/.dotfiles/.oh-my-fish.d

# Load oh-my-fish configuration.
source $fish_path/oh-my-fish.fish

# Theme
#set fish_theme robbyrussell
Theme "ratazzi"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
Plugin "bundler"
Plugin "python"
Plugin "rails"
Plugin "tmux"
Plugin "vi-mode"
Plugin "rvm"
Plugin "osx"

# Python
set VIRTUAL_ENV_DISABLE_PROMPT false
fish_prompt > /dev/null
[ -s "$HOME/.runtime/bin" ]; and . "$HOME/.runtime/bin/activate.fish"

# Mac
if [ (uname -s) = "Darwin" ]
    set -g -x LSCOLORS "ExGxBxDxCxEgEdxbxgxcxd"
    #set PATH "$PATH:/opt/local/bin:/opt/local/sbin:/usr/local/sbin"
    #set -g -x LANG 'en_US.UTF-8'
    set -g -x BYOBU_PREFIX (brew --prefix)
    alias svc="supervisorctl -c $HOME/.supervisord/supervisord.conf"
    set -g -x LC_CTYPE $LANG
end

# Linux
if [ (uname -s) = 'Linux' ]
    set -g -x TERM xterm-256color
    bindkey '^[OA' history-search-backward
    bindkey '^[OB' history-search-forward
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
end

# env
set -g -x EDITOR (which vim)
set -g -x PYTHONSTARTUP $HOME/.pystartup.py

# pyenv
# set PYENV_ROOT $HOME/.pyenv
# set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH
# [ -x (which pyenv) ]; and pyenv rehash

# alias
alias secret.gen="head -2 /dev/urandom | sha1sum | base64"

set -g -x PATH "/opt/bin" $PATH
set -g -x PATH "/usr/local/bin" $PATH
set -g -x PATH "/usr/local/sbin" $PATH
set -g -x PATH "$HOME/.bin" $PATH
set -g -x PATH "$HOME/Documents/ServicesBox/bin" $PATH
set -g -x PATH "/usr/local/mysql/bin" $PATH
set -g -x PATH "/usr/local/Cellar/gettext/0.19.4/bin" $PATH
set -g -x PATH "/Applications/Postgres.app/Contents/Versions/9.4/bin" $PATH

# Add RVM to PATH for scripting
set -g -x PATH "$HOME/.rvm/bin" $PATH

set -g -x LUAJIT '/usr/local/bin/luajit'

# go
set -g -x GOPATH $HOME/.go

set -g -x LC_ALL en_US.UTF-8

# # boot2docker
set -x DOCKER_HOST tcp://(boot2docker ip):2376
set -x DOCKER_CERT_PATH $HOME/.boot2docker/certs/boot2docker-vm
set -x DOCKER_TLS_VERIFY 1
function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l TF_ALIAS fuck
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_commandd $history[1]
    thefuck $fucked_up_commandd > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_commandd
    end
end
