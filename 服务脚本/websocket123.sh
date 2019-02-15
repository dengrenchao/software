#!/bin/bash
#author: rice
#time: 2018-08-28
#program: 判断程序是否存活，并重启




PID=websocket.php
num=0

check_pid=`ps -ef |grep $PID |grep -v "grep"|wc -l`

if [ "$check_pid" -ne "$num" ];then

    echo "runing,exit....."
else
    echo "Program does not exist..." 
    /usr/bin/php /www/new_wechat/websocket.php

fi

