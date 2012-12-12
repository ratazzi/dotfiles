set-window-option -g mode-keys vi
bind C-h select-pane -L
bind C-j select-pane -D
bind C-k select-pane -U
bind C-l select-pane -R

setw -g automatic-rename on
setw -g xterm-keys on

# vim: set ft=tmux:
