FROM alpine:latest

RUN apk update && apk add --no-cache curl unzip

# Xray indirme
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip xray.zip -d /usr/local/xray \
    && rm xray.zip

COPY config.json /etc/xray/config.json

EXPOSE 8080

CMD ["/usr/local/xray/xray", "-config=/etc/xray/config.json"]
