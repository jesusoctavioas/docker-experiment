FROM alpine:3.15

RUN apk add --no-cache dbus dbus-x11 xinit xorg-server xf86-video-fbdev xf86-video-vesa xf86-input-libinput dwm && \
    echo "allowed_users=anybody" > /etc/X11/Xwrapper.config && \
    echo "needs_root_rights=yes" >> /etc/X11/Xwrapper.config && \
    adduser -S dwm -s /bin/sh && \
    echo "exec dwm" > /home/dwm/.xinitrc

USER dwm

ENTRYPOINT ["startx"]
