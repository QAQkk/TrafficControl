#!/bin/bash

rv_state_array=($(cat /proc/net/dev | grep "eth0:"))
#echo "${rv_state_array[@]}"
#echo "Transmit = ${rv_state_array[9]} byte"

if ((${rv_state_array[9]}>${1}))
then
    poweroff
fi
