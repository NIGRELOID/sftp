FROM alpine:latest

EXPOSE 22/tcp

RUN apk -U upgrade --no-cache
RUN apk add openssh-server --no-cache

RUN addgroup sftpshare
RUN mkdir /share

COPY entrypoint /
COPY sshd_config /etc/ssh/sshd_config

ENTRYPOINT ["/entrypoint"]
