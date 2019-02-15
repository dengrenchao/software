#!/bin/bash
#author: rice
#time: 2018-08-28
#program: 判断程序是否存活，并重启




PID=xxx.sh
num=0

check_pid=`ps -ef |grep $PID |grep -v "grep"|wc -l`

if [ "$check_pid" -eq "$num" ];then

echo "start process....."
nohup /bin/sh /data/shell/$PID &
rm -rf ./nohup.out
else
echo "runing....."
fi

