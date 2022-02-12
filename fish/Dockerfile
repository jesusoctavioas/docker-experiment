FROM alpine:3.15

COPY . /root/.config/fish

RUN apk add --no-cache fish docker

ENTRYPOINT ["fish"]
