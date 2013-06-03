set-window-option -g mode-keys vi
bind C-h select-pane -L
bind C-j select-pane -D
bind C-k select-pane -U
bind C-l select-pane -R

setw -g automatic-rename on
setw -g xterm-keys on

set -g terminal-overrides "*88col*:colors=88,*256col*:colors=256,xterm*:colors=256"
set -g default-terminal "xterm-256color"
setw -g pane-border-fg blue
# vim: set ft=tmux:
