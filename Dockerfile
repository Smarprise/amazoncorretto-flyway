FROM amazoncorretto:11

COPY ./flyway.sh /opt/flyway/bin/flyway

RUN yum update -y && yum clean all && rm -rf /var/cache/yum \
    && chmod 755 /opt/flyway/bin/flyway \
    && mkdir -p /opt/flyway/lib \
    && mkdir -p /opt/flyway/jars \
    && mkdir -p /opt/flyway/sql \
    && mkdir -p /opt/flyway/conf \
    && curl -o /opt/flyway/lib/flyway-commandline-5.2.4.jar https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/5.2.4/flyway-commandline-5.2.4.jar \
    && curl -o /opt/flyway/lib/flyway-core-5.2.4.jar https://repo1.maven.org/maven2/org/flywaydb/flyway-core/5.2.4/flyway-core-5.2.4.jar \
    && curl -o /opt/flyway/lib/mysql-connector-java-8.0.18.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.18/mysql-connector-java-8.0.18.jar

ENV FLYWAY_CONFIG_FILES /opt/flyway/conf/flyway.conf
ENV FLYWAY_LOCATIONS filesystem:/opt/flyway/sql
ENV FLYWAY_JAR_DIRS /opt/flyway/jars

CMD ["/opt/flyway/bin/flyway"]
