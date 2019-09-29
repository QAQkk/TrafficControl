#!/bin/bash

rv_trafficfile='/var/log/traffic.log'

rv_state_array=($(cat /proc/net/dev | grep "eth0:"))
#echo "${rv_state_array[@]}"
#echo "Transmit = ${rv_state_array[9]} byte"

rv_transmit=${rv_state_array[9]}

if [ -e ${rv_trafficfile} ]
then
    rv_last_traffic=$(cat ${rv_trafficfile} | head -n 1)
    rv_total_traffic=$(cat ${rv_trafficfile} | tail -n 1)
    ((rv_total_traffic+=(rv_transmit-rv_last_traffic)))
    echo ${rv_transmit} > ${rv_trafficfile}
    echo ${rv_total_traffic} >> ${rv_trafficfile}
else
    echo '0' > /var/log/traffic.log
    echo '0' >> /var/log/traffic.log
    rv_last_traffic=0
    rv_total_traffic=0
fi

#echo "last_traffic = ${rv_last_traffic}"
#echo "total_traffic = ${rv_total_traffic}"

if ((rv_total_traffic>${1}))
then
    echo '0' > /var/log/traffic.log
    echo ${rv_total_traffic} >> ${rv_trafficfile}
    poweroff
fi
