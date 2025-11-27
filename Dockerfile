FROM debian:stable-slim

RUN apt update && \
    apt install -y wget unzip && \
    mkdir -p /app && \
    cd /app && \
    wget -O v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray.zip && \
    rm v2ray.zip

COPY config.json /app/config.json

EXPOSE 80

CMD ["/app/v2ray", "-config=/app/config.json"]
