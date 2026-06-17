FROM logstash:2.4.1

USER root

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN groupadd -r sunbird && \
    useradd -r -g sunbird -m -d /home/sunbird -s /bin/bash sunbird

USER sunbird