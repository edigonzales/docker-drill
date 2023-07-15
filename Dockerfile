FROM eclipse-temurin:11.0.19_7-jdk-jammy

# Starts Drill in embedded mode and connects to Sqlline
ENTRYPOINT $DRILL_HOME/bin/drill-embedded

ENV DRILL_HOME=/opt/drill
ENV DRILL_STORAGE_CONF=/tmp/drill
ENV DRILL_USER=drilluser
ENV DRILL_USER_HOME=/var/lib/drill
ENV DRILL_PID_DIR=$DRILL_USER_HOME
ENV DRILL_LOG_DIR=$DRILL_USER_HOME/log
ENV DATA_VOL=/data

RUN mkdir $DRILL_HOME $DATA_VOL $DRILL_STORAGE_CONF

RUN curl -o /tmp/apache-drill.tar.gz https://dlcdn.apache.org/drill/1.21.1/apache-drill-1.21.1.tar.gz \
 && tar -xf /tmp/apache-drill.tar.gz --strip-components 1 --directory $DRILL_HOME \
 && rm /tmp/apache-drill.tar.gz

COPY drill $DRILL_STORAGE_CONF

RUN groupadd -g 999 $DRILL_USER \
 && useradd -r -u 999 -g $DRILL_USER $DRILL_USER -m -d $DRILL_USER_HOME \
 && chown $DRILL_USER: $DATA_VOL \
 && chown $DRILL_USER: $DRILL_HOME \
 && chmod -R +rx $DRILL_HOME \
 && chown $DRILL_USER: $DRILL_STORAGE_CONF \
 && chmod -R o+rwx $DRILL_STORAGE_CONF

# A Docker volume where users may store persistent data, e.g. persistent Drill
# config by specifying a Drill BOOT option of sys.store.provider.local.path: "/data".
VOLUME $DATA_VOL


USER $DRILL_USER