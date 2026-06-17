FROM python:2.7.13-alpine

# Create non-root user
RUN addgroup -S sunbird && \
    adduser -S -G sunbird -h /home/sunbird sunbird

WORKDIR /app

COPY server.py /app/server.py

RUN chown -R sunbird:sunbird /app

ENV ECHO_SERVER_PORT=9595

EXPOSE 9595

USER sunbird

CMD ["python", "server.py"]