#!/bin/bash
#用途：删除大于7天的日志文件


find /www/fanda_new-agent/runtime/Logs/Home/ -mtime +7 -name "*.log" -exec rm -rf {} \;
find /www/fanda_new-agent/runtime/Logs/Api/ -mtime +7 -name "*.log" -exec rm -rf {} \;
find /www/fanda_new-agent/runtime/Logs/Admin/ -mtime +7 -name "*.log" -exec rm -rf {} \;
