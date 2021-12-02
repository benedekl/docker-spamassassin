FROM alpine:3.13

RUN apk add -U spamassassin \
    && addgroup -g 783 spamassassin \
    && adduser -S -D -G spamassassin -u 783 -h /var/lib/spamassassin/ spamassassin \
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh /

EXPOSE 783

ENTRYPOINT ["/entrypoint.sh"]
