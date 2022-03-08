FROM alpine:3.15

WORKDIR /home/dwm

COPY generate-x11-cookie run scripts/. /usr/local/bin/

RUN apk add --no-cache xinit xorg-server xf86-video-fbdev xf86-video-vesa xf86-input-libinput dwm openssh && \
    adduser -S dwm -s /bin/sh && \
    addgroup -S dwm && \
    addgroup dwm dwm

COPY ssh_config /etc/ssh
COPY Xwrapper.config /etc/X11

USER dwm

ENTRYPOINT ["run"]
