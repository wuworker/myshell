#!/bin/bash
# 服务管理

#第一个参数为1说明有pid文件,否则需要提供STATUS_EXEC
if [ "$1" == "1" ];then
	PID_FILE=$5
else
	STATUS_EXEC=$5
fi
#服务名,启动脚本,停止脚本,动作
SERVER_NAME=$2
START_EXEC=$3
STOP_EXEC=$4
ACTION=$6

#参数判断
if [ -z "$SERVER_NAME" ];then
	echo "server name can not empty"
	exit
elif [ -z "$START_EXEC" ];then
	echo "start exec can not empty"
	exit
elif [ -z "$STOP_EXEC" ];then
	echo "stop exec can not empty"
	exit
elif [ -z "$PID_FILE" -a -z "$STATUS_EXEC" ];then
	echo "pid file and status exec can not both empty"
	exit
fi

# #设置pid
if [ -f "$PID_FILE" ];then
	pid=$(cat "$PID_FILE")
fi

case $ACTION in
"start")
	if [ -z "$PID_FILE" ];then
		eval $START_EXEC
		echo "$SERVER_NAME is running"
	elif [ -z "$pid" ];then
		eval $START_EXEC
		echo "$SERVER_NAME is running"
	else
		echo "$SERVER_NAME is already running in $pid"
	fi
	;;
"status")
	if [ -n "$STATUS_EXEC" ];then
		eval $STATUS_EXEC
	elif [ -z "$pid" ];then
		echo "$SERVER_NAME is stopped"
	else
		echo "$SERVER_NAME is running in $pid"
	fi
	;;
"stop")
	if [ -z "$PID_FILE" ];then
		eval $STOP_EXEC
		echo "$SERVER_NAME is stopped"
	elif [ -z "$pid" ];then
		echo "$SERVER_NAME is already stopped"
	else
		eval $STOP_EXEC
		echo "$SERVER_NAME is stop"
	fi
	;;
*)
	echo "please input options[start/status/stop]"
	;;
esac

