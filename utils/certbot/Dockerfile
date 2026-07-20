FROM certbot/certbot:v1.24.0

RUN apk add --no-cache coreutils curl && \
    addgroup -S sunbird && \
    adduser -S -G sunbird -h /home/sunbird sunbird

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm -f kubectl

RUN mkdir -p /home/sunbird && \
    chown -R sunbird:sunbird /home/sunbird

USER sunbird
WORKDIR /home/sunbird

CMD ["/usr/local/bin/kubectl"]