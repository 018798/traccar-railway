FROM traccar/traccar:latest
COPY traccar.xml /opt/traccar/conf/traccar.xml
COPY logback.xml /opt/traccar/conf/logback.xml
ENV _JAVA_OPTIONS="-Dlogback.configurationFile=/opt/traccar/conf/logback.xml"
