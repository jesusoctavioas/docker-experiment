FROM alpine:3.15

ARG HOST_USER_ID

RUN apk add --no-cache nodejs && \
    adduser -S node

USER node

ENTRYPOINT ["node"]
