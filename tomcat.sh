#!/bin/bash
#tomcat管理
START_EXEC=/Users/wxl/Applications/apache-tomcat-9.0.7/bin/startup.sh
STOP_EXEC=/Users/wxl/Applications/apache-tomcat-9.0.7/bin/shutdown.sh
CATALINA_PID="/usr/local/var/run/tomcat/tomcat.pid"
export CATALINA_PID

pid=$(cat "$CATALINA_PID")

case $1 in 
	"start")
		if [ -n "$pid" ];then
			echo "tomcat is already running in $pid"
		else
			$START_EXEC
		fi
		;;
	"stop")
		if [ -n "$pid" ];then
			$STOP_EXEC
		else
			echo "tomcat is already stop"
		fi
		;;
	"status")
		if [ -n "$pid" ];then
			echo "tomcat is running in $pid"
		else
			echo "tomcat is stopped"
		fi
		;;
	*)
		echo "please input options[start/status/stop]"
		;;
esac

