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

## run (only once) processes which spawn with different name
# if (command -v gnome-keyring-daemon && ! pgrep gnome-keyring-d); then
    # gnome-keyring-daemon --daemonize --login &
# fi
if (command -v start-pulseaudio-x11 && ! pgrep pulseaudio); then
    start-pulseaudio-x11 &
fi
if (command -v /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 && ! pgrep polkit-mate-aut) ; then
    /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
fi
if (command -v  xfce4-power-manager && ! pgrep xfce4-power-man) ; then
    xfce4-power-manager &
fi

run xfsettingsd
run nm-applet
run light-locker
run xcape -e 'Super_L=Super_L|Control_L|Escape'
run thunar --daemon
run pa-applet
run pamac-tray

## The following are not included in minimal edition by default
## but autorun.sh will pick them up if you install them

if (command -v system-config-printer-applet && ! pgrep applet.py ); then
  system-config-printer-applet &
fi

run blueman-applet
run msm_notifier

