# 一、centos6系列安装openvz加速工具FinalSpeed一键安装



## 1、一键安装代码：

    wget –N —no–check–certificate https://raw.githubusercontent.com/91yun/finalspeed/master/install_fs.sh && bash install_fs.sh


## 2、一键卸载代码

     wget –N —no–check–certificate https://raw.githubusercontent.com/91yun/finalspeed/master/install_fs.sh && bash install_fs.sh uninstall


## 3、操作命令

    启动： /etc/init.d/finalspeed start
    
    停止命令：/etc/init.d/finalspeed stop
    
    状态命令（查看日志）：/etc/init.d/finalspeed status
    
    FinalSpeed是双边加速软件，不仅需要服务器端，还需要在电脑上安装客户端，下载Finalspeed1.2版本并安装，并按照以下步骤加速ss：

![1效果图](https://i.imgur.com/lBNrDSa.png)

    注意：红色地方填ss地址
    
    注意：客户端必须准确设置物理带宽，最终加速的速度不会超过所设置的带宽值，如果设置值高于实际带宽会造成丢包，导致速度变慢。传输协议Openvz只能选UDP，KVM优先选TCP。

## 4、点击添加列表
    增加加速端口，加速端口为ss端口10001，如果为其他端口，请相应修改，本地端口任意，这里填2000。

![2效果图](https://i.imgur.com/yQhNLCd.png)

## 5、最终效果
    成功连接后，FinalSpeed状态栏会出现”连接服务器成功”和“端口10001连接成功”提示。
    
    这样finalspeed就部署好了，再次打开油管观看视频，速度已经飙升至800KB/s，接近满速！！


