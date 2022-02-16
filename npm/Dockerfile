FROM alpine:3.15

ARG HOST_USER_ID

RUN apk add --no-cache npm && \
    adduser -S -u $HOST_USER_ID npm

USER npm

ENTRYPOINT ["npm"]
