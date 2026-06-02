#!/bin/sh
# Railway provides DATABASE_URL as postgresql://user:pass@host:port/db
# Traccar needs jdbc: prefix
JDBC_URL="jdbc:${DATABASE_URL}"

cat > /opt/traccar/conf/traccar.xml << EOF
<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE properties SYSTEM 'http://java.sun.com/dtd/properties.dtd'>
<properties>
  <entry key='database.driver'>org.postgresql.Driver</entry>
  <entry key='database.url'>${JDBC_URL}</entry>
  <entry key='logger.level'>INFO</entry>
  <entry key='logger.file'>/dev/stdout</entry>
  <entry key='h02.port'>5027</entry>
</properties>
EOF

exec /opt/traccar/jre/bin/java -jar /opt/traccar/tracker-server.jar /opt/traccar/conf/traccar.xml
