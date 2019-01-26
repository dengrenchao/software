#!/bin/bash
#author:rice
#datetime:2019-01-26



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

#remove docker procedure

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

cd /etc/yum.repos.d/ && wget http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

yum install -y  docker-ce-18.03.1.ce


#set docker addresss
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{

  "registry-mirrors":["https://culfukli.mirror.aliyuncs.com"]
  
}
EOF
sudo systemctl daemon-reload
sudo systemctl enable docker && ssystemctl restart docker

#docker create network
docker network create --subnet=192.168.100.0/16 mynetwork

#docker images pull 

docker pull registry.cn-hangzhou.aliyuncs.com/ricek8s/uqsjsj:fdlnp70v0.1

#make dockerfile

#create working directory
mkdir -pv /home/docker/
cd /home/docker/


#Create startup scripts
sudo tee /home/docker/run.sh <<-'EOF'

#/bin/bash
/usr/sbin/nginx
/usr/sbin/php-fpm
tail -f /dev/null

EOF

#create Dockerfile file 
sudo tee /home/docker/Dockerfile <<-'EOF'
# base image
FROM registry.cn-hangzhou.aliyuncs.com/ricek8s/uqsjsj:lnp70_v11

# MAINTAINER
MAINTAINER uqsjsj@163.com

#映射路径
#COPY $2 /etc/php-fpm.d/
ADD 111.tgz /etc/
COPY run.sh /run.sh
RUN chmod +x /run.sh
#开放端口

EXPOSE 500 501 502 

#开机自启动
ENTRYPOINT  ["/bin/bash","run.sh"]

EOF

docker build lnp70_v11:v11.0 .

docker run -it -d -P  --restart=always  --network mynetwork --ip 192.168.10.100 --name test2 lnp70_v11:v11.0

sudo tee /bin/dockerpid <<-'EOF'
#!/bin/bash

x1=${1}

docker exec -it $x1 bash

EOF

docker ps -a 



