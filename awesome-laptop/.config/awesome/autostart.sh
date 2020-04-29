#!/usr/bin/env bash
# ---
# Use "run program" to run it only if it is not already running
# Use "program &" to run it regardless
# ---
# NOTE: This script runs with every restart of AwesomeWM

function run {
  if ! pgrep $1 > /dev/null;
  then
    $@&
  fi
}

# use compton to eliminate tearing
run compton -b

# start network widget
run nm-applet
