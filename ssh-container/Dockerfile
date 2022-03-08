FROM alpine:3.15

ARG DOCKER_GROUP_ID

COPY container_runner /usr/local/bin
COPY scripts/. /usr/local/bin

RUN adduser -D -s /bin/sh client && \
    addgroup -S -g $DOCKER_GROUP_ID docker && \
    adduser client docker && \
    passwd -u client && \
    apk add --no-cache openssh docker xauth && \
    mkdir /home/client/.ssh /home/client/ssh-keys && \
    chmod 700 /home/client/.ssh /home/client/ssh-keys && \
    ssh-keygen -N '' -f /home/client/ssh-keys/id_rsa -C '' && \
    chown -R 100:100 /home/client/ssh-keys && \
    cat /home/client/ssh-keys/id_rsa.pub > /home/client/.ssh/authorized_keys && \
    chmod 600 /home/client/.ssh/authorized_keys && \
    chown -R client:client /home/client/.ssh && \
    ssh-keygen -A

COPY sshd_config /etc/ssh

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
