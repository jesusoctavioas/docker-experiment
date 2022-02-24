FROM alpine:3.15

ARG DOCKER_GROUP_ID

COPY . /etc/fish/conf.d

RUN apk add --no-cache fish xauth docker && \
    adduser -S -s /usr/bin/fish fish && \
    addgroup -S -g $DOCKER_GROUP_ID fish && \
    addgroup fish fish

USER fish

WORKDIR /home/fish

ENTRYPOINT ["fish"]
