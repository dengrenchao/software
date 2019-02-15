#!/bin/bash
#用途：循环进程




while true
do


/bin/php /www/fanda_new-agent/index.php crontab/check_task/check  >> /home/log/crontabcheck-zs.log 2>&1 && sleep 10;cat /dev/null >/home/log/crontabcheck-zs.log
#/bin/php /www/fanda_new-agent/index.php crontab/check_task/check  >> /home/log/crontabcheck-zs.log 2>&1 && sleep 10;cat /dev/null >/home/log/crontabcheck-zs.log



done
