if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    export XDG_SESSION_TYPE=x
    exec startx
fi
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 2 ]; then
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    exec sway --my-next-gpu-wont-be-nvidia
fi

