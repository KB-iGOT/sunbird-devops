FROM python:3.9.0-alpine

MAINTAINER Revathi Kotla <revathi21kotla@gmail.com>

# Create non-root user
RUN addgroup -S sunbird && \
    adduser -S -G sunbird -h /home/sunbird sunbird

RUN mkdir -p /src

WORKDIR /src

COPY requirements.txt /src/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY collector.py /src/collector.py
COPY components.yaml /src/components.yaml

# Set ownership
RUN chown -R sunbird:sunbird /src

USER sunbird

EXPOSE 9999

CMD ["python", "collector.py"]