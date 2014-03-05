# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# ZSH_THEME="gentoo"
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
plugins=(git python osx pip brew rails vagrant supervisor redis-cli history-substring-search celery autojump)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all
setopt NO_NOMATCH

# Customize to your needs...
CLICOLOR=1
OS=`uname -s`
MODE_INDICATOR="%{$fg_bold[red]%}%{$fg[red]%}[COMMAND]%{$reset_color%}"
# export GIT_PROXY_COMMAND="$HOME/.dotfiles/socks5proxywrapper"
export EDITOR=`which vim`

# {{{ VI MODE
# bindkey -v
# bindkey -M viins 'jj' vi-cmd-mode
# bindkey "^R" history-incremental-search-backward
# bindkey '\e[A' history-search-backward
# bindkey '\e[B' history-search-forward
# # VI MODE KEYBINDINGS (ins mode)
# bindkey -M viins '^a'    beginning-of-line
# bindkey -M viins '^e'    end-of-line
# bindkey -M viins '^k'    kill-line
# bindkey -M viins '^r'    history-incremental-pattern-search-backward
# bindkey -M viins '^s'    history-incremental-pattern-search-forward
# bindkey -M viins '^p'    up-line-or-history
# bindkey -M viins '^n'    down-line-or-history
# bindkey -M viins '^y'    yank
# bindkey -M viins '^w'    backward-kill-word
# bindkey -M viins '^u'    backward-kill-line
# bindkey -M viins '^h'    backward-delete-char
# bindkey -M viins '^?'    backward-delete-char
# bindkey -M viins '^_'    undo
# bindkey -M viins '^x^r'  redisplay
# bindkey -M viins '\eOH'  beginning-of-line # Home
# bindkey -M viins '\eOF'  end-of-line       # End
# bindkey -M viins '\e[2~' overwrite-mode    # Insert
# bindkey -M viins '\ef'   forward-word      # Alt-f
# bindkey -M viins '\eb'   backward-word     # Alt-b
# bindkey -M viins '\ed'   kill-word         # Alt-d
#
# # VI MODE KEYBINDINGS (cmd mode)
# bindkey -M vicmd '^a'    beginning-of-line
# bindkey -M vicmd '^e'    end-of-line
# bindkey -M vicmd '^k'    kill-line
# bindkey -M vicmd '^r'    history-incremental-pattern-search-backward
# bindkey -M vicmd '^s'    history-incremental-pattern-search-forward
# bindkey -M vicmd '^p'    up-line-or-history
# bindkey -M vicmd '^n'    down-line-or-history
# bindkey -M vicmd '^y'    yank
# bindkey -M vicmd '^w'    backward-kill-word
# bindkey -M vicmd '^u'    backward-kill-line
# bindkey -M vicmd '/'     vi-history-search-forward
# bindkey -M vicmd '?'     vi-history-search-backward
# bindkey -M vicmd '^_'    undo
# bindkey -M vicmd '\ef'   forward-word                      # Alt-f
# bindkey -M vicmd '\eb'   backward-word                     # Alt-b
# bindkey -M vicmd '\ed'   kill-word                         # Alt-d
# bindkey -M vicmd '\e[5~' history-beginning-search-backward # PageUp
# bindkey -M vicmd '\e[6~' history-beginning-search-forward  # PageDown

# vim_ins_mode="%{$fg[cyan]%}[INSERT]%{$reset_color%}"
# vim_cmd_mode="%{$fg[green]%}[NORMAL]%{$reset_color%}"
# vim_mode=$vim_ins_mode
#
# function zle-keymap-select {
#   vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
#   zle reset-prompt
# }
# zle -N zle-keymap-select
#
# function zle-line-finish {
#   vim_mode=$vim_ins_mode
# }
# zle -N zle-line-finish
# RPROMPT='${vim_mode}'
# }}}

# Tweak zsh-syntax-highlighting
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root)
# ZSH_HIGHLIGHT_STYLES[path]='none'
# ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=red,bold')

# Macbook Pro battery percent
function battery_charge {
    echo `~/.bin/battery.py` 2>/dev/null
}

# Mac
if [[ "$OS" == 'Darwin' ]]; then
    #RPROMPT='$(battery_charge)'
    #LSCOLORS=exfxcxdxbxegedabagacad
    LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
    export PATH="$PATH:/opt/local/bin:/opt/local/sbin:/usr/local/sbin"
    export LANG='en_US.UTF-8'
    export BYOBU_PREFIX=$(brew --prefix)
    alias supervisorctl="supervisorctl -c $HOME/.supervisord/supervisord.conf"
fi

# Linux
if [[ "$OS" == 'Linux' ]]; then
    TERM=xterm-256color
    bindkey '^[OA' history-search-backward
    bindkey '^[OB' history-search-forward
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

# python
[[ -s "$HOME/.pystartup.py" ]] && PYTHONSTARTUP=$HOME/.pystartup.py
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && . "$HOME/.pythonbrew/etc/bashrc"
[[ -s "$HOME/.runtime/bin" ]] && . "$HOME/.runtime/bin/activate"

# utils
[[ -s "$HOME/.bin" ]] && PATH="$HOME/.bin:$PATH"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# ServicesBox
# [[ -s "$HOME/Documents/ServicesBox/activate" ]] && . "$HOME/Documents/ServicesBox/activate"

alias lx="$HOME/Dropbox/ratazzi/utils/xunlei-lixian/lixian_cli.py"
alias secret.gen="head -2 /dev/urandom | sha1sum | base64"
alias bm='byobu-tmux'

[[ -d "/usr/local/mysql/bin" ]] && export PATH="/usr/local/mysql/bin:$PATH"

# vim: set fdm=marker:

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
