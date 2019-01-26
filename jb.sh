#!/bin/bash


#configuration yum

yum -y install epel*
yum -y install wget curl git \
gcc gcc-c++ unzip vim bin bind-utils \
nslookup telnet net-tools nfs-utils lsof \
tcpdump htop python-pip nmap-ncat.x86_64 iptables \
lrzsz 



#close selinux

setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

#close firewalld
sudo systemctl disabled firewalld



#install docker procedure

#remove docker

sudo yum remove docker \
                docker-client \
                docker-client-latest \
                docker-common \
                docker-latest \
                docker-latest-logrotate \
                docker-logrotate \
                docker-selinux \
                docker-engine-selinux \
                docker-engine

#install docker

cd /etc/yum.repo.d/ && wget http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

yum install -y  docker-ce-18.03.1.ce


#set docker addresss
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{

  "registry-mirrors":["https://culfukli.mirror.aliyuncs.com"]
  
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker


#


