FROM alpine:3.15

ARG DOCKER_GROUP_ID

WORKDIR /home/dwm

COPY generate-x11-cookie /usr/local/bin
COPY scripts/. /usr/local/bin
COPY run /usr/local/bin

RUN apk add --no-cache xauth xinit xorg-server xf86-video-fbdev xf86-video-vesa xf86-input-libinput dwm docker && \
    echo "allowed_users=anybody" > /etc/X11/Xwrapper.config && \
    echo "needs_root_rights=yes" >> /etc/X11/Xwrapper.config && \
    adduser -S dwm -s /bin/sh && \
    addgroup -S -g $DOCKER_GROUP_ID dwm && \
    addgroup dwm dwm

USER dwm

ENTRYPOINT ["run"]
