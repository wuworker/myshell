#!/bin/bash
#tomcat管理

MANAGER_EXEC=/Users/wxl/myshell/server/servermanager.sh

SERVER_NAME="tomcat"
START_EXEC="/Users/wxl/Applications/apache-tomcat-9.0.7/bin/startup.sh"
STOP_EXEC="/Users/wxl/Applications/apache-tomcat-9.0.7/bin/shutdown.sh"
PID_FILE=/usr/local/var/run/tomcat/tomcat.pid

export CATALINA_PID="$PID_FILE"
$MANAGER_EXEC 1 "$SERVER_NAME" "$START_EXEC" "$STOP_EXEC" "$PID_FILE" $1
