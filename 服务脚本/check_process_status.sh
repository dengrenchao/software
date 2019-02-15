#!/bin/bash
#用途:判断程序是否存活，目录是否挂载


process_status_nginx=`ps -ef |grep nginx |grep root |grep -v "grep" |awk '{print $1}'`
process_status_php=`ps -ef |grep php-fpm |grep root |grep -v "grep" |awk '{print $1}'`
process_status_mount=`df -h |grep 27f464aed8-ymy84.cn-shenzhen.nas.aliyuncs.com |wc -l`
process_num=1
num="root"

date_time=`date +'%Y-%m-%d %H:%M:%S'`
dir_file="/home/log"



#创建日志目录
if [ -d $dir_file ];then
    echo "目录存在，退出..."
else 
   echo "目录不存在，创建目录" &&  mkdir -pv /home/log  2>&1

fi


#判断nginx服务
if [ "$process_status_nginx" = "$num" ];then
    echo "nginx服务正常,退出..."
else
    echo "$date_time 服务异常启动服务..." >>$dir_file/process_log.txt
    /usr/bin/systemctl start nginx

fi


#判断php-fpm服务
if [ "$process_status_php" = "$num" ];then
    echo "php-fpm服务正常,退出..."
else
    echo "$date_time 服务异常启动服务" >>$dir_file/process_log.txt
    /usr/bin/systemctl start php-fpm

fi


#判断mount挂载是否存在

if [ $process_status_mount -eq $process_num ];then
    echo "挂载目录存在，退出..."
else
    echo "目录不存在,开始挂载"
    /bin/mount -t nfs  27f464aed8-ymy84.cn-shenzhen.nas.aliyuncs.com:/ /www/fanda_new-agent/upload/
   /bin/mount -t nfs  27f464aed8-ymy84.cn-shenzhen.nas.aliyuncs.com:/ /www/fanda-yufabu-agent/upload/
	
fi
