FROM alpine:3.15

ARG DOCKER_GROUP_ID

ENV ENV /home/dwm/.profile

RUN apk add --no-cache dbus dbus-x11 xinit xorg-server xf86-video-fbdev xf86-video-vesa xf86-input-libinput dwm docker && \
    echo "allowed_users=anybody" > /etc/X11/Xwrapper.config && \
    echo "needs_root_rights=yes" >> /etc/X11/Xwrapper.config && \
    adduser -S dwm -s /bin/sh && \
    addgroup -S -g $DOCKER_GROUP_ID dwm && \
    addgroup dwm dwm && \
    echo "exec dwm" > /home/dwm/.xinitrc

USER dwm

WORKDIR /home/dwm

COPY .profile .

ENTRYPOINT ["startx"]
