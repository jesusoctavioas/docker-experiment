FROM alpine:3.15

COPY config.fish /etc/fish/conf.d/
COPY variables.fish /etc/fish/conf.d/

RUN apk add --no-cache fish xauth && \
    adduser -S -s /bin/sh fish && \
    addgroup -S fish && \
    addgroup fish fish

USER fish

WORKDIR /home/fish

ENTRYPOINT ["fish"]
