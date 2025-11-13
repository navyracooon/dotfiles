#!/bin/bash
tmux split-window -v -c "#{pane_current_path}"
tmux select-pane -U
tmux resize-pane -D 17
sleep 0.3
clear
