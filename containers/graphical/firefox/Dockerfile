FROM alpine:3.15

ARG HOST_USER_ID

# xorg support
ENV XAUTHORITY /.Xauthority

RUN apk add --no-cache firefox ttf-dejavu && \
    adduser -S -u $HOST_USER_ID firefox

USER firefox

ENTRYPOINT ["firefox"]
