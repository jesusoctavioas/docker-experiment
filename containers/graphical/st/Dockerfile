FROM alpine:3.15 as base

RUN apk add --no-cache st ttf-liberation

# will use the x session of the host
FROM base as host

ENV XAUTHORITY /.Xauthority

RUN adduser -S -s /bin/sh st

USER st

ENTRYPOINT ["st"]

# will use the X session of a running container
FROM base as container

# makes the POSIX shell source .profile when starting an interactive session
ENV ENV /home/st/.profile

WORKDIR /home/st

COPY .profile .

RUN apk add --no-cache openssh && \
    adduser -S -s /bin/sh st && \
    addgroup -S st && \
    addgroup st st

COPY ssh_config /etc/ssh

USER st

ENTRYPOINT ["st"]
