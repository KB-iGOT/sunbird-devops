FROM golang:1.13.10 AS builder

WORKDIR /work

# Create non-root user
RUN groupadd -r sunbird && \
    useradd -r -g sunbird -u 10001 sunbird

COPY main.go /work

RUN go get github.com/segmentio/kafka-go && \
    go get github.com/segmentio/kafka-go/snappy

RUN CGO_ENABLED=0 go build -o kafka-topic-exporter main.go

FROM scratch

LABEL maintainer="Rajesh Rajendran <rjshrjndrn@gmail.com>"

# Copy user information
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group

# Copy application
COPY --from=builder /work/kafka-topic-exporter /kafka-topic-exporter

EXPOSE 8000

USER 10001

CMD ["/kafka-topic-exporter"]