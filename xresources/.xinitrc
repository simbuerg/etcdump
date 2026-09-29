# xrandr --newmode "2560x1440_30.00" 146.25 2560 2680 2944 3328 1440 1443 1448 1468 -hsync +vsync
# xrandr --newmode "3840x2160_30.00"  338.75  3840 4080 4488 5136  2160 2163 2168 2200 -hsync +vsync
# 
# xrandr --addmode DP1-8 "2560x1440_30.00"
# xrandr --addmode DP1-1 "3840x2160_30.00"

xrdb -load ~/.Xresources

# 1. Start the D-Bus session bus if not already active
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval $(dbus-launch --sh-syntax --exit-with-session)
fi

# 2. Initialize and export the GNOME Keyring variables
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export XDG_CURRENT_DESKTOP=GNOME

exec awesome
