FROM alpine:3.15

WORKDIR /home/firefox

RUN apk add --no-cache firefox ttf-dejavu pciutils-libs mesa-egl mesa-gl && \
    adduser -S -s /bin/sh firefox

USER firefox

ENTRYPOINT ["firefox"]
