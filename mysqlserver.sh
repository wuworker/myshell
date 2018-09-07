#!/bin/bash
#mysql服务管理

MYSQL_EXEC=/usr/local/bin/mysql.server

action=$1
if [ -z "$action" ];then
	action="status"
fi

$MYSQL_EXEC $action


