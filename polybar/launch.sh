#!/usr/bin/zsh

# Terminate already running bar instances
killall -q polybar

# Launch main bar
echo "---" | tee -a /tmp/polybar_main.log
polybar main 2>&1 | tee -a /tmp/polybar_main.log & disown

echo "Bars launched..."
