#!/bin/bash
#mysql服务管理
EXEC=/usr/local/bin/mysql.server

MANAGER_EXEC=/Users/wxl/myshell/server/servermanager.sh

SERVER_NAME="mysql server"
START_EXEC="$EXEC start"
STOP_EXEC="$EXEC stop"
STATUS_EXEC="$EXEC status"


$MANAGER_EXEC 2 "$SERVER_NAME" "$START_EXEC" "$STOP_EXEC" "$STATUS_EXEC" $1