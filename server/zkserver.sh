#!/bin/bash
#zk服务管理
EXEC=/usr/local/bin/zkServer

MANAGER_EXEC=/Users/wxl/myshell/server/servermanager.sh

SERVER_NAME="zookeeper server"
START_EXEC="$EXEC start"
STOP_EXEC="$EXEC stop"
STATUS_EXEC="$EXEC status"


$MANAGER_EXEC 2 "$SERVER_NAME" "$START_EXEC" "$STOP_EXEC" "$STATUS_EXEC" $1
