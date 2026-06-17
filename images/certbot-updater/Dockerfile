FROM alpine:latest

LABEL maintainer="rjshrjndrn@gmail.com"

RUN apk update && \
    apk add --no-cache curl certbot

# Create non-root user
RUN addgroup -S sunbird && \
    adduser -S -G sunbird -h /home/sunbird sunbird

# Download kubectl
RUN export release=$(curl -L -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/${release}/bin/linux/amd64/kubectl \
    --output /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

USER sunbird

ENTRYPOINT ["/usr/local/bin/kubectl"]
