#!/bin/bash
#redis服务管理

CONF_FILE=/usr/local/etc/redis.conf
PID_FILE=/usr/local/var/run/redis/redis_6379.pid
SER_EXEC=/usr/local/bin/redis-server
CLI_EXEC=/usr/local/bin/redis-cli

if [ ! -f "$CONF_FILE" ];then
	echo "redis conf not exist!"
	exit
fi

if [ -f "$PID_FILE" ];then
	pid=$(cat "$PID_FILE")
fi		

case $1 in
"start")
	if [ -n "$pid" ];then
		echo "redis-server is already running in $pid"
	else
		$SER_EXEC $CONF_FILE
		echo "redis is starting"
	fi
	;;
"status")
	if [ -n "$pid" ];then
		echo "redis-server is running in $pid"
	else
		echo "redis-server is not run!"
	fi
	;;
"stop")
	if [ -n "$pid" ];then
		$CLI_EXEC shutdown
		echo "redis-server is shutdown"
	else
		echo "redis-server is not run!"
	fi
	;;
*)
	echo "please input options[start/status/stop]"
		;;
esac

