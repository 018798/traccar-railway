FROM traccar/traccar:latest
COPY logback.xml /opt/traccar/conf/logback.xml
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENV _JAVA_OPTIONS="-Dlogback.configurationFile=/opt/traccar/conf/logback.xml"
ENTRYPOINT ["/entrypoint.sh"]
