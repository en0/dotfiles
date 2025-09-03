#!/bin/bash

DWM_BIN="/usr/local/bin/dwm"
DWM_SHA="$(sha1sum $DWM_BIN)"

# Launch WM
$DWM_BIN & DWM_PID=$!

# Non-Blocking things
cat $HOME/.fehbg | sh

# Blocking things
/usr/bin/dunst & DUNST_PID=$!
/usr/bin/nm-applet & NMAPPLET_PID=$!
/usr/local/bin/nenostatus & NENOSTATUS_PID=$!
$HOME/.bin/watch-current-media & MEDIAWATCH_PID=$!
$HOME/.bin/tool-clipboard_history monitor & CLIPBOARD_PID=$!

while true; do

    # Wait for exit
    wait $DWM_PID

    # Exit unless dwm binary has changed.
    DWM_SHA_NEW="$(sha1sum $DWM_BIN)"
    [[ "$DWM_SHA" == "$DWM_SHA_NEW" ]] && break

    # Launch WM
    DWM_SHA="$DWM_SHA_NEW"
    $DWM_BIN & DWM_PID=$!
    sleep 1 && notify-send \
        -u "low" \
        -i $HOME/src/dwm/dwm.png \
        "DWM Restarted" \
        "Binary change detected."

done

# Kill blocking things
kill $DUNST_PID
kill $NMAPPLET_PID
kill $NENOSTATUS_PID
kill $MEDIAWATCH_PID
kill $CLIPBOARD_PID
