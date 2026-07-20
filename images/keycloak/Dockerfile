FROM jboss/keycloak-postgres:latest

USER root

RUN rm /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml

COPY ./images/keycloak/standalone-ha.xml \
    /opt/jboss/keycloak/standalone/configuration/

COPY ./images/keycloak/postgresql-9.4.1212.jar \
    /opt/jboss/keycloak/modules/system/layers/keycloak/org/postgresql/main/

COPY ./images/keycloak/module.xml \
    /opt/jboss/keycloak/modules/system/layers/keycloak/org/postgresql/main/

COPY ./images/keycloak/docker-entrypoint.sh \
    /opt/jboss/

RUN chmod +x /opt/jboss/docker-entrypoint.sh && \
    chown -R jboss:jboss /opt/jboss

USER jboss

ENTRYPOINT ["/opt/jboss/docker-entrypoint.sh"]

CMD ["--server-config", "standalone-ha.xml"]