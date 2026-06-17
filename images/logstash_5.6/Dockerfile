FROM logstash:5.6

USER root

# Create non-root user
RUN groupadd -r sunbird && \
    useradd -r -g sunbird -m -d /home/sunbird -s /bin/bash sunbird

# Ensure Logstash directories are accessible
RUN chown -R sunbird:sunbird /usr/share/logstash

USER sunbird

ENTRYPOINT ["/usr/share/logstash/bin/logstash","--pipeline.batch.size","1","-f","/etc/telemetry-logstash.conf"]
