#!/bin/sh
# Parse DATABASE_PUBLIC_URL: postgresql://user:pass@host:port/db
NO_SCHEME="${DATABASE_PUBLIC_URL#*://}"
USERPASS="${NO_SCHEME%@*}"
DB_USER="${USERPASS%%:*}"
DB_PASS="${USERPASS#*:}"
HOSTPORTDB="${NO_SCHEME#*@}"
DB_HOST="${HOSTPORTDB%%:*}"
PORTDB="${HOSTPORTDB#*:}"
DB_PORT="${PORTDB%%/*}"
DB_NAME="${PORTDB#*/}"

JDBC_URL="jdbc:postgresql://${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=require"
echo "Connecting to: ${JDBC_URL} as ${DB_USER}"

cat > /opt/traccar/conf/traccar.xml << EOF
<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE properties SYSTEM 'http://java.sun.com/dtd/properties.dtd'>
<properties>
  <entry key='database.driver'>org.postgresql.Driver</entry>
  <entry key='database.url'>${JDBC_URL}</entry>
  <entry key='database.user'>${DB_USER}</entry>
  <entry key='database.password'>${DB_PASS}</entry>
  <entry key='logger.level'>INFO</entry>
  <entry key='logger.file'>/dev/stdout</entry>
  <entry key='h02.port'>5027</entry>
</properties>
EOF

exec /opt/traccar/jre/bin/java -jar /opt/traccar/tracker-server.jar /opt/traccar/conf/traccar.xml
