FROM alpine:3.15

ARG HOST_USER_ID

RUN apk add --no-cache nodejs && \
    adduser -S -u $HOST_USER_ID node

USER node

ENTRYPOINT ["node"]
