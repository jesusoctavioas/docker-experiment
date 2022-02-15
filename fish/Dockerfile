FROM alpine:3.15

ARG HOST_USER_ID
ARG DOCKER_GROUP_ID

COPY . /etc/fish/conf.d

RUN apk add --no-cache fish docker && \
    adduser -S -s /usr/bin/fish -u $HOST_USER_ID fish && \
    addgroup -S -g $DOCKER_GROUP_ID fish && \
    addgroup fish fish

USER fish

WORKDIR /home/fish

ENTRYPOINT ["fish"]
