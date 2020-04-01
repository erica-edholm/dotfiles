#!/usr/bin/env bash
LARGE_DPI=168
SMALL_DPI=96
current_dpi=$( grep 'dpi' ~/.Xresources | awk '{print $2}')

if [ $current_dpi -lt $LARGE_DPI ]
then
    sed -i '0,/'$current_dpi'/{s/'$current_dpi'/'$LARGE_DPI'/}' ~/.Xresources
else
    sed -i '0,/'$current_dpi'/{s/'$current_dpi'/'$SMALL_DPI'/}' ~/.Xresources
fi

echo $(grep 'dpi' .Xresources | awk '{print $2}')

xrdb -merge ~/.Xresources
i3-msg restart
