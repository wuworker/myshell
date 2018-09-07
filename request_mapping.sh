#!/bin/bash
#获取java的controller里的request mapping的所有url
#第一个参数输入文件或文件夹
#第二个参数为输出文件


#构建url,去掉多余的/
function buildUrl(){
	local tail=$(echo $2|sed 's/^\///'|sed 's/\/$//')
	if [[ "$1" == "/" ]];then
		echo /${tail}
	else
		local head=$(echo $1|sed 's/^\///'|sed 's/\/$//')
		echo /${head}/${tail}
	fi
}

#从文件获取Mapping的url
function getUrlInFile(){
	local first=''
	#截取Mapping的注解获取括号中的值
	for i in $(cat $1 | grep "Mapping"|grep -v "import"|awk -F '[()]' '{print $2}'|sed 's/[[:space:]]//g')
	do
		#以,进行分割
		local arr=(${i//,/ })
		for j in ${arr[*]}
		do
			local url=''
			#如果有value,取=号右边
			if [[ "$j" =~ value ]];then
				url=$(echo $j|cut -d '=' -f 2|sed 's/"//g')
			#没有value直接拿
			elif [[ "$j" =~ ^\".*\"$ ]];then
				url=$(echo $j|sed 's/"//g')
			fi
			#拿到的第一个Mapping为类上的注解
			if [ -z "$first" ];then
				first=$url
			elif [ -n "$url" ];then
				echo $(buildUrl $first $url)
			fi
		done
	done
}

#文件过滤
function filteFile(){
	if [[ "$1" =~ .*Controller\.java$ ]];then
		return 0
	else
		return 1
	fi
}

#遍历文件树
function walkFileTree(){
	if [ -f "$1" ];then
		filteFile $1
		if [ "$?" == "0" ];then
			local result=$(getUrlInFile $1)
			local name=$(echo $1|awk -F "/" '{print $NF}'|cut -d '.' -f 1)
			echo ${name}: 
			echo $result
			echo "------------------------------------------------"
		fi
	elif [ -d "$1" ];then
		for i in $(ls $1)
		do
			local path=$(echo $1|sed 's/\/$//')
			path=${path}/$i
			walkFileTree $path
		done
	fi
}

if [ -n "$2" ];then
	echo "" > $2
	for i in $(walkFileTree $1)
	do
		echo $i >> $2
	done
	count=$(cat $2|grep -v "\-\-\-"|grep -v ":"|wc -l)
	count2=$(cat $2|grep "\-\-\-"|wc -l)
	echo "" >> $2
	echo "controller个数:$count2" >> $2
	echo "接口总数:$count" >> $2
else
	echo "请输入输出文件"
fi
