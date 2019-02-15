#!/bin/bash
#用途：kill掉进程，并且删除旧文件


variable_num="php"
number=2
pid_num=`ps -ef |grep "$variable_num" |grep -v "grep" |awk '{print $2}'`
pid_wl=`ps -ef |grep "$variable_num" |grep -v "grep" |wc -l`

if [ "$pid_wl" -gt "$number" ];then
    
    echo "######################进程杀死###################################"
    echo "Kill the process..." && kill -9 $pid_num 2>&1
    rm -rf  /www/new_wechat/websocket.php
    #sh /data/shell/websocket123.sh

else

    echo "No value out of,exit...."

fi


