#!/bin/bash
#用途：循环上一个脚本

for i in {1..3}
do

nohup sh /data/shell/shangxueyuan-zhengshifu.sh & 2>&1
rm -rf /data/shell/nohup.out


done
