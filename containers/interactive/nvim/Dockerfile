FROM alpine:3.15

ARG HOST_USER_ID

RUN apk add --no-cache neovim && \
    adduser -S -u $HOST_USER_ID nvim

USER nvim

ENTRYPOINT ["nvim"]
