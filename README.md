# TrafficControl
### 食用方法
~~*监控后若重启将会影响正常流量控制*~~

    sudo -i
    wget https://raw.githubusercontent.com/bfsdo0/TrafficControl/master/TrafficControl.sh && chmod +x TrafficControl.sh
##### crontab -e
    */2 * * * *  /bin/bash /root/TrafficControl.sh 100000000000
##### 附：阿里云删除监控/云盾/残留
    wget http://update.aegis.aliyun.com/download/uninstall.sh
    chmod +x uninstall.sh
    sudo ./uninstall.sh
    wget http://update.aegis.aliyun.com/download/quartz_uninstall.sh
    chmod +x quartz_uninstall.sh
    sudo ./quartz_uninstall.sh
    sudo pkill aliyun-service
    sudo rm -fr /etc/init.d/agentwatch /usr/sbin/aliyun-service
    sudo rm -rf /usr/local/aegis*
    iptables -I INPUT -s 140.205.201.0/28 -j DROP
    iptables -I INPUT -s 140.205.201.16/29 -j DROP
    iptables -I INPUT -s 140.205.201.32/28 -j DROP
    iptables -I INPUT -s 140.205.225.192/29 -j DROP
    iptables -I INPUT -s 140.205.225.200/30 -j DROP
    iptables -I INPUT -s 140.205.225.184/29 -j DROP
    iptables -I INPUT -s 140.205.225.183/32 -j DROP
    iptables -I INPUT -s 140.205.225.206/32 -j DROP
    iptables -I INPUT -s 140.205.225.205/32 -j DROP
    sudo /usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh stop
    sudo /usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh remove
    sudo rm -rf /usr/local/cloudmonitor
