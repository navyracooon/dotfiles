#!/bin/bash
tmux split-window -v -c "#{pane_current_path}"
tmux select-pane -U
tmux split-window -h -c "#{pane_current_path}"
tmux resize-pane -D 19
tmux select-pane -L
sleep 0.3
clear
