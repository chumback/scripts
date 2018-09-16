#! /bin/sh

# This script sets the ip address of the first ethernet device found (should be "eth0" on most Raspberries) to 169.254.155.1
# then configures the routing table to route packets to 169.254.155.0/24 through that device.
# If this file is invoked from ~/.bashrc this configuration will be made upon login.

ETHERNET_DEVICES=$(basename -- /sys/class/net/e*)
DEVICE=${ETHERNET_DEVICES[0]}
#echo "Configuring device: $DEVICE"
sudo ip link set $DEVICE up
sudo ip addr add 169.254.155.1 dev $DEVICE
sudo ip route add 169.254.155.0/24 via 169.254.155.1 dev $DEVICE
