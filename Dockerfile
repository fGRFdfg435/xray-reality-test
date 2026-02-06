FROM debian:12-slim

RUN apt update && apt install -y curl unzip ca-certificates && rm -rf /var/lib/apt/lists/*

# نصب Xray
RUN curl -Ls https://github.com/XTLS/Xray-install/raw/main/install-release.sh | bash

COPY config.json /usr/local/etc/xray/config.json

EXPOSE 8080
CMD ["xray", "run", "-config", "/usr/local/etc/xray/config.json"]
