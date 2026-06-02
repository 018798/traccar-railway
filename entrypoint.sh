#!/bin/sh
# Railway DATABASE_PUBLIC_URL is postgres://user:pass@host:port/db
# Strip scheme, force jdbc:postgresql://
DB_URL_NO_SCHEME="${DATABASE_PUBLIC_URL#*://}"
JDBC_URL="jdbc:postgresql://${DB_URL_NO_SCHEME}?sslmode=require"

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

echo "Connecting to: ${JDBC_URL}"
exec /opt/traccar/jre/bin/java -jar /opt/traccar/tracker-server.jar /opt/traccar/conf/traccar.xml
