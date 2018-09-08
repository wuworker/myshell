#!/bin/bash
#mongo服务管理

MANAGER_EXEC=/Users/wxl/myshell/server/servermanager.sh

PID_FILE=/usr/local/var/run/mongodb/mongod.pid
SERVER_NAME="redis server"
START_EXEC="/usr/local/bin/mongod -f /usr/local/etc/mongod.conf"
STOP_EXEC="mongo admin --eval 'db.shutdownServer()' && rm -f $PID_FILE"


$MANAGER_EXEC 1 "$SERVER_NAME" "$START_EXEC" "$STOP_EXEC" "$PID_FILE" $1


