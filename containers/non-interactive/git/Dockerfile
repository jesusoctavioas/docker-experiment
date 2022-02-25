FROM alpine:3.15

ARG HOST_USER_ID

COPY gitconfig /etc

RUN apk add --no-cache git && \
    adduser -S -u $HOST_USER_ID git

USER git

ENTRYPOINT ["git"]
