# TrafficControl
### 食用方法
##### *监控后若重启将会影响正常流量控制*
    sudo -i
    wget https://raw.githubusercontent.com/bfsdo0/TrafficControl/master/TrafficControl.sh && chmod +x TrafficControl.sh
##### crontab -e
    */2 * * * *  /bin/bash /root/TrafficControl.sh 100000000000
