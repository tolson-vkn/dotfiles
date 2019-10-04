#!/bin/sh
if tmux has-session -t "$1"; then
	exec tmux attach-session -t "$1"
else
	. ~/.profile
	exec tmux new-session -s "$1"
fi
