#!/bin/bash
#redis服务管理

MANAGER_EXEC=/Users/wxl/myshell/server/servermanager.sh

SERVER_NAME="redis server"
START_EXEC="/usr/local/bin/redis-server /usr/local/etc/redis.conf"
STOP_EXEC="/usr/local/bin/redis-cli shutdown"
PID_FILE=/usr/local/var/run/redis/redis_6379.pid


$MANAGER_EXEC 1 "$SERVER_NAME" "$START_EXEC" "$STOP_EXEC" "$PID_FILE" $1

