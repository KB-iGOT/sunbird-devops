ARG BASE
FROM ${BASE}

# Create non-root user (Alpine-based images)
RUN addgroup -S sunbird && \
    adduser -S -G sunbird -h /home/sunbird sunbird

WORKDIR /app

COPY opa /app

# Give ownership of application files
RUN chown -R sunbird:sunbird /app

USER sunbird

ENTRYPOINT ["./opa"]
CMD ["run"]