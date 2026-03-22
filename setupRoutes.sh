#!/bin/bash

ip link add ipvlan0 link wlp1s0 type ipvlan mode l2
ip addr add 192.168.1.192/28 dev ipvlan0
ip link set ipvlan0 up
ip route add 192.168.1.192/28 dev ipvlan0
