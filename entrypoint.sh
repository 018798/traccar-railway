#!/bin/sh
cat > /opt/traccar/conf/traccar.xml << EOF
<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE properties SYSTEM 'http://java.sun.com/dtd/properties.dtd'>
<properties>
  <entry key='database.driver'>org.postgresql.Driver</entry>
  <entry key='database.url'>jdbc:postgresql://${DB_HOST}:${DB_PORT}/${DB_NAME}</entry>
  <entry key='database.user'>${DB_USER}</entry>
  <entry key='database.password'>${DB_PASSWORD}</entry>
  <entry key='logger.level'>INFO</entry>
  <entry key='logger.file'>/dev/stdout</entry>
  <entry key='h02.port'>5027</entry>
</properties>
EOF
exec /opt/java/bin/java -jar /opt/traccar/lib/tracker-server.jar /opt/traccar/conf/traccar.xml
