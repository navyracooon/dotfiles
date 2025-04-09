#!/bin/bash
tmux split-window -h -c "#{pane_current_path}"
tmux split-window -v -c "#{pane_current_path}"
tmux select-pane -R
tmux split-window -v -c "#{pane_current_path}"
tmux select-pane -U
tmux resize-pane -D 9
tmux select-pane -R 
tmux resize-pane -D 9
tmux select-pane -L
tmux select-pane -U
sleep 0.3
clear
