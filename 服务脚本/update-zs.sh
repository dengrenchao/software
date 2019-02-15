#!/bin/bash
#用途：更新代码仓库


#定义变量
code_type=${1}
local_ip=`ifconfig eth0 |grep inet |awk '{print $2}'`
local_name=`hostname`

#logfile=/var/log/UpdateGit/`date +%Y-%m-%d`_${code_type}.log
#判断路径是否存在
#if [ ! -d "/var/log/UpdateGit" ];then
#mkdir -p /var/log/UpdateGit
#fi

if [ ! $code_type ]; then
    echo  -e "Please use the correct grammar, for example (project name)"
	exit 3
else
    cd /www/${code_type}
    #开始更新
    git_version_old=`git log | sed  -n 1p |awk '{print $2}'`
    echo -e "开始更新版本:${git_version_old}"
    echo -e "[主机名字:${local_name}]"
    echo -e "[主机地址:${local_ip}]"
    echo -e "[`date +'%Y-%m-%d %H:%M:%S'` ${code_type}更新开始]"
    git pull
	
fi


#项目中变量
cd /www/$code_type
git_version_new=`git log | sed  -n 1p |awk '{print $2}'`
gitpull_version_date=`git log -1 --date=iso|grep Date|awk -F " " '{print $2,$3}'`
gitpull_branch=`git branch |awk '{print $2}'`

#输出结果
echo -e "$gitpull_branch"
echo -e "当前更新版本:${git_version_new}"
echo -e "当前版本更新时间:$gitpull_version_date"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++完美的分割线+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"


