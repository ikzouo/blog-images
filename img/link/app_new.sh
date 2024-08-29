#!/bin/bash

export PATH="${JAVA_HOME}/bin:${JAVA_HOME}/jre/bin:$PATH"
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JRE_HOME=$JAVA_HOME/jre


#定义jar包名
export JAR="srm-sit.jar"
#定义端口
export JAR_PORT="12381"
#定义配置文件
export APP_ARGS="--spring.profiles.active=shuyulocalnew"
#定义启动参数
export JVM_ARGS="-server -Xms4g -Xmx4g -Xmn512m -XX:MetaspaceSize=689m -XX:MaxMetaspaceSize=689m  -verbose:gc -XX:+PrintGCDateStamps -XX:+PrintGCDetails -Xloggc:/mnt/local/tomcat/gc_log/%p_gc.log -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/mnt/local/tomcat/gc_log/ -Djava.awt.headless=true -XX:+DisableExplicitGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:ParallelCMSThreads=4 -XX:CMSInitiatingOccupancyFraction=70 -Dserver.port=${JAR_PORT}"

function showcmd() {
    echo "exec nohup
    ${JAVA_HOME}/bin/java
      ${JVM_ARGS}
      -jar ${JAR}
      ${APP_ARGS}
    >/dev/null 2>&1 &"
}


function start() {

  pid=$(getpid)

  if [[ -n $pid ]]; then
    echo -e "Process already running (pid: $pid)"
  else
    echo -e "Begin starting process"

     exec nohup \
    ${JAVA_HOME}/bin/java \
      ${JVM_ARGS} \
      -jar ${JAR} \
      ${APP_ARGS} \
    >/dev/null 2>&1 &

    echo -e "Start process success"
  fi
}


function stop() {
  pid=$(getpid)

  if [[ -n $pid ]]; then
    echo -e "Begin stopping process (pid: $pid)"

    kill -9 $pid

    # 5 seconds is not enough
    sleep 10

    echo -e "Stop process success"
  else
    echo -e "Process not running"
  fi
}


function status() {
  pid=$(getpid)

  if [[ -n $pid ]]; then
    echo -e "Process running with pid: $pid"
  else
    echo -e "Process not running" >&2
  fi
}


function restart() {
  stop
  start
}


function getpid() {
  #ps axu |grep ${JAVA_HOME}/bin/java |grep "server.port=${SERVER_PORT}" |grep -v grep |awk '{print $2}'
  ps axu |grep java |grep "server.port=${JAR_PORT}" |grep -v grep |awk '{print $2}'
}


case $1 in
  start)
    start
    status
    ;;
  stop)
    stop
    ;;
  status)
    status
    ;;
  restart)
    restart
    ;;
  showcmd)
    showcmd
    ;;
  *)
    echo "Usage: bash $0 {start|stop|status|restart|showcmd}"
    ;;
esac
