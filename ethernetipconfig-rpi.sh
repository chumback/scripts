#!/bin/bash

STATIC_IP="169.254.155.10"

if [ -z "$1" ]; then
    echo "please specify ethernet device name"
else
    ethernet_device_name="$1"
    echo $ethernet_device_name " will be changed to static ip:" $STATIC_IP
    sudo ip link set $ethernet_device_name up
    sudo ip addr add $STATIC_IP dev $ethernet_device_name
    sudo ip route add 169.254.155.0/24 dev $ethernet_device_name
fi
