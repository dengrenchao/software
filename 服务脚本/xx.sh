#!/bin/sh
while :
do
  n=`mysqladmin processlist -h172.18.111.26 -ufadmin -pFd00$RF%TG^YH|grep -i sleep |wc -l`
  date=`date +%Y%m%d\[%H:%M:%S]`
  echo $n
  if [ "$n" -gt 10 ]
  then
  for i in `mysqladmin processlist -h172.18.111.26 -ufadmin -pFd00$RF%TG^YH|grep -i sleep |awk '{print $2}'`
  do
     mysqladmin -uadmin -p*** kill $i
  done
  echo "sleep is too many I killed it " >> /tmp/sleep.log
  echo "$date : $n" >> /tmp/sleep.log
  fi
  sleep 1
done
