FROM alpine:3.5

# Install packages
RUN apk --update --no-cache add openssh python-dev

RUN apk --update --no-cache add build-base libffi-dev openssl-dev py-pip \
 && pip install cffi \
 && pip install ansible==2.4.1 \
 && pip uninstall -y cffi \
 && apk del build-base libffi-dev openssl-dev \
 && rm -rf /root/cache

# Create non-root user
RUN addgroup -S sunbird && \
    adduser -S -G sunbird -h /home/sunbird sunbird

# Create application directory and assign ownership
RUN mkdir -p /ansible && \
    chown -R sunbird:sunbird /ansible

ENV ANSIBLE_HOST_KEY_CHECKING=False
ENV SSH_AUTH_SOCK=/ssh-agent

WORKDIR /ansible

USER sunbird

CMD ["nc", "-k", "-l", "8000"]
