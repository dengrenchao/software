#!/bin/bash
#@author loong
#@date 2018/12/06 10:43:00
#用于推送课堂事先录制好的记录

cd /www/fanda_new-agent/

for ((i=1; i<60; i = i + 1))
do
        $(/usr/bin/php index.php crontab/task/push_classroom_msg_record > /dev/null 2>&1 &)
        sleep 1
done
