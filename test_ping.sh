#!/bin/bash

vpn_en=0
zero=0
while : 
do
    rm -rf ./baidu.ping
    rm -rf ./google.ping
    ping -c 5 www.baidu.com > ./baidu.ping
    result=$(grep  -rn "icmp_seq" ./baidu.ping )
    if [[ "$result" != "" ]];
    then
        rm -rf ./baidu.ping
        ping -c 1 www.google.com > ./google.ping
        result1=$(grep  -rn "icmp_seq" ./google.ping )
        if [[ "$result1" != "" ]] && [[ $vpn_en -eq $zero ]]; 
        then
            echo "vpn is working now"
            vpn_en=1
        elif [[ "$result1" == "" ]] && [[ $vpn_en -ne $zero ]];
        then
            echo "vpn is not working now"
        fi
    else
        echo "Please check the network"
        break
    fi
    sleep 3600
done




