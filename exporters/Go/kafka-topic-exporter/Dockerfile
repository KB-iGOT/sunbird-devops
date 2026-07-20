FROM scratch

LABEL maintainer="Rajesh Rajendran <rjshrjndrn@gmail.com>"

ADD kafka-topic-exporter /

USER 10001

EXPOSE 8000

CMD ["/kafka-topic-exporter"]
