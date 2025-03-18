#!/bin/bash

export HADOOP_VERSION=3.3.1
export METASTORE_VERSION=3.1.2
export AWS_SDK_VERSION=1.11.901
export LOG4J_VERSION=2.8.2

export JAVA_HOME=/opt/java/openjdk
export HADOOP_HOME=/opt/hadoop-${HADOOP_VERSION}
export HADOOP_CLASSPATH=${HADOOP_HOME}/share/hadoop/tools/lib/aws-java-sdk-bundle-${AWS_SDK_VERSION}.jar:${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-aws-${HADOOP_VERSION}.jar:${HIVE_HOME}/lib/log4j-core-${LOG4J_VERSION}.jar:${HIVE_HOME}/lib/log4j-api-${LOG4J_VERSION}.jar:${HIVE_HOME}/lib/log4j-1.2-api-${LOG4J_VERSION}.jar:${HIVE_HOME}/lib/log4j-slf4j-impl-${LOG4J_VERSION}.jar
export HIVE_HOME=/opt/apache-hive-metastore-${METASTORE_VERSION}-bin
cat <<EOF | tee -a ${HIVE_HOME}/db_user.sql
  create user hive with password '$PASSWORD';
  create database metastore_db WITH OWNER hive;
  GRANT CREATE ON SCHEMA public TO PUBLIC;
EOF

PGPASSWORD="$PASSWORD" psql -U postgres -h postgres -p 5432 -f ${HIVE_HOME}/db_user.sql 
rm ${HIVE_HOME}/db_user.sql;

${HIVE_HOME}/bin/schematool -initSchema -dbType postgres
${HIVE_HOME}/bin/start-metastore
