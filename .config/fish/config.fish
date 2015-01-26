# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
#set fish_theme robbyrussell
set fish_theme ratazzi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins autojump bundler python rails rake tmux vi-mode rvm

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/.dotfiles/.oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

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
set -g -x POEM_SETTINGS local_settings
set -g -x WEB_SETTINGS local_settings
set -g -x PYTHONSTARTUP $HOME/.pystartup.py

# # pyenv
# set PYENV_ROOT $HOME/.pyenv
# set -x PATH $PYENV_ROOT/shims $PYENV_ROOT/bin $PATH
# pyenv rehash

# alias
alias secret.gen="head -2 /dev/urandom | sha1sum | base64"
alias bm='byobu-tmux'

alias ideviceinstaller='env DYLD_LIBRARY_PATH=/opt/libimobiledevice-macosx /opt/libimobiledevice-macosx/ideviceinstaller'
alias ii='env DYLD_LIBRARY_PATH=/opt/libimobiledevice-macosx /opt/libimobiledevice-macosx/ideviceinstaller -i'
alias idevicesyslog='env DYLD_LIBRARY_PATH=/opt/libimobiledevice-macosx /opt/libimobiledevice-macosx/idevicesyslog'
alias idevicescreenshot='env DYLD_LIBRARY_PATH=/opt/libimobiledevice-macosx /opt/libimobiledevice-macosx/idevicescreenshot'
alias ideviceinfo='env DYLD_LIBRARY_PATH=/opt/libimobiledevice-macosx /opt/libimobiledevice-macosx/ideviceinfo'

# set -g -x NDK_ROOT "/opt/android-ndk-r8e"
# set -g -x PATH "/opt/adt-bundle-mac-x86_64-20131030/sdk/tools:/opt/adt-bundle-mac-x86_64-20131030/sdk/platform-tools:/opt/adt-bundle-mac-x86_64-20131030/sdk/build-tools/android-4.4:/opt/android-ndk-r8e" $PATH
set -g -x PATH "/opt/bin" $PATH
set -g -x PATH "$HOME/.bin" $PATH
set -g -x PATH "$HOME/Documents/ServicesBox/bin" $PATH
set -g -x PATH "/usr/local/mysql/bin" $PATH
# Add RVM to PATH for scripting
set -g -x PATH "$HOME/.rvm/bin" $PATH
set -g -x LUAJIT '/usr/local/bin/luajit'
set -g -x DOCKER_HOST 'tcp://'
