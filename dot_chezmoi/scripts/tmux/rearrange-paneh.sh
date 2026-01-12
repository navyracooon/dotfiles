#!/bin/bash
tmux split-window -h -c "#{pane_current_path}"
tmux select-pane -L
sleep 0.3
clear
