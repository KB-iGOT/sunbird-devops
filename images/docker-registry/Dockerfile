FROM registry:2

# Create non-root user
RUN addgroup -S sunbird && \
    adduser -S -G sunbird -h /home/sunbird sunbird

COPY images/docker-registry/docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh && \
    chown sunbird:sunbird /docker-entrypoint.sh

USER sunbird

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/etc/docker/registry/config.yml"]