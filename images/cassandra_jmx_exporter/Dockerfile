FROM openjdk:8-jre-alpine

ENV APP_HOME=/opt/app

# Create non-root user
RUN addgroup -S sunbird && \
    adduser -S -G sunbird -h /home/sunbird sunbird

RUN mkdir -p ${APP_HOME}

WORKDIR ${APP_HOME}

COPY images/cassandra_jmx_exporter/jmx_prometheus_httpserver-0.11.jar .
COPY images/cassandra_jmx_exporter/logging.properties .

# Set ownership
RUN chown -R sunbird:sunbird ${APP_HOME}

USER sunbird

EXPOSE 5556

ENTRYPOINT ["java"]
CMD ["-jar", "jmx_prometheus_httpserver-0.11.jar", "5556", "/opt/app/jmx_httpserver.yml"]