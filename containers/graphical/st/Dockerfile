FROM alpine:3.15 as base

RUN apk add --no-cache st ttf-liberation

# will use the x session of the host
FROM base as host

ARG HOST_USER_ID

ENV XAUTHORITY /.Xauthority

RUN adduser -S -u $HOST_USER_ID -s /bin/sh st

USER st

ENTRYPOINT ["st"]

# will use the x session of a running container
FROM base as container

ARG DOCKER_GROUP_ID

# makes the POSIX shell source .profile when starting an interactive session
ENV ENV /home/st/.profile

WORKDIR /home/st

COPY .profile .

RUN apk add --no-cache docker && \
    adduser -S -s /bin/sh st && \
    addgroup -S -g $DOCKER_GROUP_ID st && \
    addgroup st st

USER st

ENTRYPOINT ["st"]
