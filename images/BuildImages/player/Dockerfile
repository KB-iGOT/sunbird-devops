FROM node:8.11-slim

RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    apt-get update && \
    apt-get -y install \
        libxpm4 \
        libxrender1 \
        libgtk2.0-0 \
        libnss3 \
        libgconf-2-4 \
        xvfb \
        gtk2-engines-pixbuf \
        xfonts-cyrillic \
        xfonts-100dpi \
        xfonts-75dpi \
        xfonts-base \
        xfonts-scalable \
        google-chrome-stable \
        git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN groupadd -r sunbird && \
    useradd -r -g sunbird -m -d /home/sunbird -s /bin/bash sunbird

USER sunbird
WORKDIR /home/sunbird