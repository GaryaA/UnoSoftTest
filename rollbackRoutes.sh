#!/bin/bash

ip route delete 192.168.1.192/28
ip link set ipvlan0 down
ip addr delete 192.168.1.192/28 dev ipvlan0
ip link delete ipvlan0



