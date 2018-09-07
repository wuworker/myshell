#!/bin/bash
# 删除正则不匹配的文件
# 2个参数
# 第一个参数为搜索的目录
# 第二个参数为y表示不需要确认，否则需要确认,默认n
#
#

reg="^[-0-9a-zA-Z_.]+$"

function matchFile(){
        if [[ "$1" =~ $reg ]];then
                return 1
        else
                return 0
        fi
}

echo "match file regex:$reg"
echo -e "\n"

dir=$1
confirm=$2

if [ ! -d $dir ];then
        echo "first param must dir"
        exit
fi

if [ -z $confirm ];then
        confirm="n"
fi

IFS=$'\n'
for i in $(ls -i $dir)
do
        inode=$(echo $i|awk '{print $1}')
        name=$(echo $i|awk '{print $2}')
        matchFile $name
        if [ "$?" == "0" ];then
                if [ "$confirm" != "y" ];then
                        read -p "rm $inode,$name? " ans
                fi
                if [ "$confirm" == "y" -o "$ans" == "y" ];then
                        find -inum $inode -delete
                fi
        fi
done
