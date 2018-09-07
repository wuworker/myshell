#!/bin/bash
#zk服务管理
EXEC=/usr/local/bin/zkServer

action=$1
if [ -z "$action" ];then
	action="status"
fi

$EXEC $action
