#!/bin/sh
echo Starting Tomcat server...
 
# Start of configurable settings
 
export JAVA_HOME=/usr/local/openjdk-11
export CATALINA_HOME=/usr/local/tomcat
export APPLICATION_HOME=/opt/netreveal
#export SSA_HOME=/opt/ssa
export SSA_HOME=
 
# End of configurable settings
 
export SSATOP=$SSA_HOME
export SSABIN=$SSA_HOME/bin
export SSAN3LOGDIR=$SSATOP/log
export SSANUL=nul
export SSAPR=$SSA_HOME/pr
export SSATEMP=$SSA_HOME/temp
export SSA_N3HOST=localhost:1665
export SSA_N3PORT=1665
export SSAJAVA=$JAVA_HOME/bin/javaw
export SSAWORKDIR=$SSA_HOME
export PATH=$SSATOP/bin:$PATH
#export LD_LIBRARY_PATH=$SSABIN:$LD_LIBRARY_PATH
#export LD_LIB_PATH=$SSABIN:$LD_LIB_PATH
#export SHLIB_PATH=$SSABIN:$SHLIB_PATH
#export LIBPATH=$SSABIN:$LIBPATH

if [ ! -d /opt/netreveal/logs ]; then
   mkdir /opt/netreveal/logs
fi


if [ ! -d  $SSAN3LOGDIR ]; then
   mkdir $SSAN3LOGDIR
fi
 
export JVM_ARGS="-Djava.library.path=$SSABIN"
 
# Auto-cleanup of log files.
 
export JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,address=0.0.0.0:5005,server=y,suspend=n"
 
export JAVA_OPTS="$JVM_OPTS $JAVA_OPTS -Dapplication.home=$APPLICATION_HOME -Dapplication.configuration=$APPLICATION_HOME/conf/base_config.properties -Dlog4j.configuration=$APPLICATION_HOME/conf/log4j.properties -Dorg.apache.commons.logging.Log=org.apache.commons.logging.impl.Log4JLogger"
 
export NOPAUSE=true
 
export CATALINA_OPTS="$CATALINA_OPTS $JAVA_OPTS -XX:MaxPermSize=320m -server  -Dspring.datasource.jmxEnabled=false"
 
$CATALINA_HOME/bin/startup.sh

