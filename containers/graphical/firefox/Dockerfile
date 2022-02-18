FROM alpine:3.15

ARG HOST_USER_ID

ENV DISPLAY :0

RUN apk add --no-cache firefox ttf-dejavu && \
    adduser -S -u $HOST_USER_ID firefox

USER firefox

ENTRYPOINT ["firefox"]
